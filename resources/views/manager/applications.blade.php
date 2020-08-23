@extends('layouts.managerDashboard')
@section('content')
    <div class="row mt-5">

        <div class="col-md-12">
            <h2>Aplicatii Deschise</h2>
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
                        <th scope="col">Nume Student</th>
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
                        <td>{{$app->user->name}}</td>
                        <td style="{{$app->status == "Rejected" || $app->status == "Cancelled"  ? 'color:red' : 'color:green'}}">{{$app->status}}</td>
                        <td>{{$app->interview_id == 0 ? 'Nesetat' : 'Programat' }}</td>
                        <td><button type="button" class="btn btn-primary addInt" data-toggle="modal" data-jid="{{$app->job->id}}" data-uid="{{$app->user->id}}" data-target="#exampleModal">
                                Adauga Interviu
                            </button>
                            <button class="btn btn-info"><a style="color: white!important;" href="{{route('student_info',['userId'=>$app->user->id])}}">Info Student</a></button>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
                <ul>
                    {{$data->applications->links()}}
                </ul>
        </div>
        <!-- Modal Adaugare interviu -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Adauga Interviu</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Inainte de a adauga un interviu te rugam sa verifici profilul studentului.</p>
                        <form action="" method="POST" id="intForm">
                            @csrf
                            <input type="hidden" value="" id="form-jid">
                            <input type="hidden" value="" id="form-uid">
                            <input type="hidden" value="{{route('addInterview')}}" id="form-url">
                            <label for="doi">Data Interviu</label>
                            <div class="form-group">
                                <input type="datetime-local" id="interviewDate" name="doi">
                            </div>

                            <button class="btn btn-info" value="submit" id="saveInt" type="submit">Salveaza Interviu</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    @endsection
