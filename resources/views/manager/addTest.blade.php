@extends('layouts.managerDashboard')
@section('content')

    <div class="row">
     <div class="col-md-8">
         <h2 style="margin-top:5vh;">Adauga Teste</h2>
     </div>
    </div>
    <div class="row">
        <div class="col-md-4">
            <form action="{{route('addTest')}}" method="POST">
                @csrf
                <div class="row">
                    <div class="col-md-12">
                        @if(session()->has('success'))
                            <div class="alert alert-primary" role="alert" id="alert">
                                {{session()->get('success')}}
                            </div>
                        @endif
                        @if($errors->any())
                            <div class="alert alert-danger" role="alert" id="alert">
                               @foreach($errors->all() as $err)
                                   <p class="bold">
                                       {{$err}}
                                   </p>
                                @endforeach
                            </div>
                        @endif
                        <div class="form-group">
                            <label for="user_id">Nume Student</label>
                            <select class="form-control" name="user_id" id="user_id">
                                @foreach($data->students as $st)
                                    <option value="{{$st->id}}">{{$st->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="title">Nume Test</label>
                            <input class="form-control" type="text" name="title" id="title">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="author">Interviator</label>
                            <input class="form-control" type="text" name="author" id="author">
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="status">Calificativ</label>
                            <input class="form-control" type="text" name="status" id="status">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            <label for="m">Interviator</label>
                            <input type="datetime-local" name="date" class="form-control">
                        </div>
                    </div>
                </div>
                <button class="btn btn-success" type="submit">Adauga Test</button>
            </form>
        </div>
    </div>
@endsection
