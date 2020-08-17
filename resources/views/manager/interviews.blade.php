@extends('layouts.managerDashboard')
@section('content')
    <div class="row mt-5">

        <div class="col-md-12">
            <h2>Interviuri Programate</h2>
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
                        <th scope="col">Data si ora</th>
                        <th scope="col">Status</th>
                        <th scope="col">Actiuni</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($data->interviews as $int)
                    <tr>
                        <th scope="row">{{$int->id}}</th>
                        <td>{{$int->job->title}}</td>
                        <td>{{$int->user->name}}</td>
                        <td>{{$int->date}}</td>
                        <td>{{$int->status}}</td>
                        <td>
                            <button class="btn btn-outline-danger">
                                <a style="color:black!important" href="{{route('modifyInt',['status'=>0,'intId'=>$int->id,'userId'=>$int->user->id])}}">
                                    Refuza
                                </a>
                            </button>
                            <button class="btn btn-success">
                                <a style="color:black!important" href="{{route('modifyInt',['status'=>1,'intId'=>$int->id,'userId'=>$int->user->id])}}">
                                    Accepta
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
