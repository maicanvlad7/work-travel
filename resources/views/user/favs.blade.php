@extends('layouts.studentDashboard')
@section('content')
    <div class="container">
        <div class="row mt-5">

            <div class="col-md-12">
                <h2>Favoritele Mele</h2>
            </div>
            <div class="col-md-6 mt-5">
                @if(session()->has('success'))
                    <div class="alert alert-primary" role="alert" id="alert">
                        {{session()->get('success')}}
                    </div>
                @endif
            </div>
        </div>
    </div>
        <div class="container">
            <div class="row">
                @foreach($data->jobInfo as $j1)
                    @foreach($j1 as $jd)
                        <div class="col-lg-4">
                            <div class="single_place">
                                <div class="thumb">
                                    <img src="@if(isset($jd->image_path)){{asset($jd->image_path)}}@else{{asset('img/noimage.png')}}@endif" alt="">
                                    <a href="#" class="prise">${{$jd->rate}}/ora</a>
                                </div>
                                <div class="place_info">
                                    <a href="destination_details.html"><h3>{{$jd->title}}</h3></a>
                                    @if(in_array($jd->id, $data->favList))
                                        <a href="{{route('remove_user_fav',['jobId'=>$jd->id])}}"><img src="{{asset('img/star.png')}}" alt=""></a>
                                    @endif
                                    <p>{{$jd->region}}</p>
                                    <div class="rating_days d-flex justify-content-between">
                            <span class="d-flex justify-content-center align-items-center">
                                <i class="fa fa-briefcase" style="margin-right: 1vh;"></i>{{$jd->employer}}
                            </span>
                                        <div class="days">
                                            <i class="fa fa-clock-o"></i>
                                            <a href="#">{{$jd->hours}} ore/sapt</a>
                                        </div>
                                    </div>

                                    <div class="row mt-10">
                                        <div class="col-md-6 mg-center">
                                            <a class="btn btn-danger mg-center" href="{{route('getJobInfo',['id'=>$jd->id])}}">Detalii Job</a>
                                        </div>
                                        <div class="col-md-6">
                                            <p class="text-success float-right">{{$jd->available_positions}} disponibile</p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    @endforeach
                @endforeach
            </div>

        </div>


    @endsection
