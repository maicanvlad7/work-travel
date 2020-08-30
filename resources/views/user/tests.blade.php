@extends('layouts.studentDashboard')
@section('content')
    <div class="row mt-5">

        <div class="col-md-12">
            <h2>Testele mele</h2>
        </div>
        <div class="col-md-12 mt-5">
            @if(session()->has('success'))
                <div class="alert alert-primary" role="alert" id="alert">
                    {{session()->get('success')}}
                </div>
            @endif
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Denumire</th>
                        <th scope="col">Evaluator</th>
                        <th scope="col">Calificativ</th>
                        <th scope="col">Data</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($data->tests as $tst)
                    <tr>
                        <th scope="row">{{$tst->id}}</th>
                        <td>{{$tst->title}}</td>
                        <td>{{$tst->author}}</td>
                        <td>{{$tst->status}}</td>
                        <td>{{$tst->date}}</td>
                    </tr>
                @endforeach
                </tbody>
            </table>
                <ul>
                    {{$data->tests->links()}}
                </ul>
        </div>
    </div>


    @endsection
