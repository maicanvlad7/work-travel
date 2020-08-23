@extends('layouts.studentDashboard')
@section('content')
    <div class="row mt-5">

        <div class="col-md-12">
            <h2>Documentele mele</h2>
        </div>
        <div class="col-md-12 mt-5">
            @if(session()->has('success'))
                <div class="alert alert-primary" role="alert" id="alert">
                    {{session()->get('success')}}
                </div>
            @endif
        </div>

        <div class="col-md-8 mb-5">
            @if(count($data->document) != 0 && isset($data->document))
                <div class="row">
                    @foreach($data->document as $doc)
                        <div class="col-md-2 text-center">
                            <img src="{{asset('img/document.png')}}" alt="">
                            <h3 >{{$doc->storage_path}}</h3>
                            <div class="row">
                                <div class="col-md-6">
                                    <button class="btn btn-danger"><a style="color:white!important" href="{{route('delete_document',['id'=>$doc->id])}}">Stergere</a></button>
                                </div>
                                <div class="col-md-6">
                                    <button class="btn btn-info"><a style="color:white!important" href="{{asset('storage/5CV.pdf')}}" target="_blank" >Vizualizare</a></button>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            @endif

        </div>

        <div class="col-md-8">

            <!-- Daca nu are documente il lasam sa genereze un CV sau sa incarce-->
            @if(isset($data->document) && count($data->document) == 0)
                @if (count($errors) > 0)
                    <div class="alert alert-danger">
                        <strong>Oops!</strong> Te rugam sa corectezi urmatoarele erori : <br><br>
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif

                <form action="{{ route('document_submit') }}" method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="form-group">
                        <input type="file" class="form-control-file" name="fileName" id="fileName" aria-describedby="fileHelp">
                        <small id="fileHelp" class="form-text text-muted">Please Choose file</small>
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>

                <div class="alert alert-info mt-5 hideGenerate" role="alert">
                    Nu ai incarcat niciun document. Incarca unul acum sau genereaza un CV online
                </div>
                <button class="btn btn-success hideGenerate" id="gen_start">Genereaza CV</button>

                <div class="row" style="visibility: hidden;" id="cvGenerator">
                    <div class="col-md-8">
                        <form action="{{route('generate_cv')}}" method="post">
                            @csrf
                            <h2>Generare CV</h2>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="firstName">Prenume</label>
                                        <input type="text" name="firstName" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="lastName">Nume</label>
                                        <input type="text" name="lastName" class="form-control">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="email">Email</label>
                                        <input type="text" name="email" class="form-control">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="phone">Nr. Telefon</label>
                                        <input type="text" name="phone" class="form-control">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="experience">Experienta anterioara</label>
                                        <textarea name="experience" id="" cols="30" rows="10" class="form-control"></textarea>
                                        <p class="text-info">Te rugam sa ne spui daca ai mai lucrat pana acum si care au fost raspunderile tale.</p>
                                    </div>
                                </div>
                            </div>

                            <button class="btn btn-outline-success mb-5">Genereaza CV</button>

                        </form>
                    </div>
                </div>

            @endif

        </div>
    </div>


    @endsection
