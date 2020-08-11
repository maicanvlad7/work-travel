@extends('layouts.studentDashboard')
@section('content')
    <div class="row mt-5">

        <div class="col-md-12">
            <h2>Aplicatiile mele</h2>
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
                        <th scope="col">Regiune</th>
                        <th scope="col">Status</th>
                        <th scope="col">Interviu</th>
                        <th scope="col">Actiuni</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($data->applications as $app)
                    <tr>
                        <th scope="row">{{$app->id}}</th>
                        <td>{{$app->job->title}}</td>
                        <td>{{$app->job->region}}</td>
                        <td style="{{$app->status == "Rejected" || $app->status == "Cancelled"  ? 'color:red' : 'color:green'}}">{{$app->status}}</td>
                        <td>Nesetat</td>
                        <td>
                            <button class="btn btn-sm btn-danger" style="{{$app->status == "Pending" ? '' : 'display:none!important;'}}">
                                <a style="color:white;" href="{{$app->status == "Pending" ? route('cancelApplication',['appId'=>$app->id]) : ''}}">
                                    Anuleaza
                                </a>
                            </button>
                            <button class="btn btn-sm btn-info">
                                <a style="color:white;" href="{{route('getJobInfo',['id'=>$app->job->id])}}">
                                    Vezi job
                                </a>
                            </button>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
                <ul>
                    {{$data->applications->links()}}
                </ul>
        </div>
    </div>


    @endsection
