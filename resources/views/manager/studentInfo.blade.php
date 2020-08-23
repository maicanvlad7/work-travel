@extends('layouts.managerDashboard')
@section('content')
    <div class="row mt-5">

        <div class="col-md-12">
            <h2 class="">Informatii despre <h2 class="text-info">{{$data->student->name}}</h2></h2>
        </div>
        <div class="col-md-12 mt-5">
            @if(session()->has('success'))
                <div class="alert alert-primary" role="alert" id="alert">
                    {{session()->get('success')}}
                </div>
            @endif
        </div>

        <div class="col-md-6">
            <h4>Email: <span>{{$data->student->email}}</span></h4>
            <h4>Nr. Telefon: <span>{{$data->student->phone_nr}}</span></h4>

            <h2 class="mt-5">Documente: </h2>
            @if(isset($data->document))
                @foreach($data->document as $doc)
                    <div class="col-md-2 text-center">
                        <img src="{{asset('img/document.png')}}" alt="">
                        <h3 >{{$doc->storage_path}}</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <button class="btn btn-info"><a style="color:white!important" href="{{asset('storage/'.$doc->storage_path)}}" target="_blank" >Vizualizare</a></button>
                            </div>
                        </div>
                    </div>
                @endforeach
                @else
                <div class="alert alert-info" role="alert">
                    {{$data->student->name}} nu are inca documente incarcate.
                </div>
            @endif

        </div>
    </div>


    @endsection
