@extends('layouts.studentDashboard')
@section('content')
    <div class="row mt-5">

        <div class="col-md-12">
            <h2>Interviurile mele</h2>
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
                        <th scope="col">Nume Job</th>
                        <th scope="col">Status</th>
                        <th scope="col">Data : Ora</th>
                        <th scope="col">Actiuni</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($data->interviews as $int)
                    <tr>
                        <th scope="row">{{$int->id}}</th>
                        <td>{{$int->job->title}}</td>
                        <td>{{$int->status}}</td>
                        <td>{{$int->date}}</td>
                        <td>
                            <button class="btn btn-sm btn-info">
                                <a style="color:white;" href="{{route('getJobInfo',['id'=>$int->job->id])}}">
                                    Vezi job
                                </a>
                            </button>
                        </td>

                    </tr>
                @endforeach
                </tbody>
            </table>
                <ul>
                    {{$data->interviews->links()}}
                </ul>
        </div>
    </div>


    @endsection
