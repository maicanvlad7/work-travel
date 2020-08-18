@extends('layouts.app')
@section('content')

    <div class="container">
        <div class="row">
            <div class="col-md-12 destinationHeader">
                <h3 class="text-lg-center">{{$jobInfo->title}}</h3>
                <p>{{$jobInfo->region}} -- {{$jobInfo->employer}}</p>
            </div>
        </div>
    </div>

    <div class="destination_details_info">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-9">
                    <div class="destination_info">
                        <h3>Descriere</h3>
                        <p>@if(!empty($jobInfo->description))
                               {{$jobInfo->description}}
                            @else
                                <span class="text-info">Acest loc de munca nu are o descriere inca. Anunta agentia raspunzatoare de el.</span>
                            @endif
                        </p>
                        <div class="single_destination">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Facilitati</h4>
                                    @foreach($jobInfo->facilitiesName as $jifn)
                                        <ul class="form-control" style="margin-top:1vh;">
                                            <li class=""><span class="fa fa-star mr-3composer require tcg/voyager starHover"></span>{{$jifn->name}}</li>
                                        </ul>
                                    @endforeach
                                    <p></p>
                                </div>
                            </div>
                        </div>
                        <div class="single_destination">
                            <h4>Day-02</h4>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words.</p>
                        </div>
                        <div class="single_destination">
                            <h4>Day-03</h4>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words.</p>
                        </div>
                    </div>

                   @auth
                        @if(!isset($jobInfo->canApply))
                        <div class="row">
                            <div class="col-md-12 text-center">
                                <button class="btn-lg btn-danger"><a style="color:white!important;" href="{{route('user_apply',['uid'=>Auth::id(),'jid'=>$jobInfo->id])}}">Aplica Acum</a></button>
                                    @if ($errors->any())
                                        <p class="text-danger">Ne pare rau, ati aplicat deja la alt job!</p>
                                    @endif
                                    @if (session('success'))
                                        <p class="text-success mt-2">Ai aplicat cu succes! Un interviu va fi setat in curand!</p>
                                    @endif
                            </div>
                        </div>
                        @endif
                       @endauth

                </div>
            </div>
        </div>
    </div>

    <!-- newletter_area_start  -->
    <div class="newletter_area overlay">
        <div class="container">
            <div class="row justify-content-center align-items-center">
                <div class="col-lg-10">
                    <div class="row align-items-center">
                        <div class="col-lg-5">
                            <div class="newsletter_text">
                                <h4>Subscribe Our Newsletter</h4>
                                <p>Subscribe newsletter to get offers and about
                                    new places to discover.</p>
                            </div>
                        </div>
                        <div class="col-lg-7">
                            <div class="mail_form">
                                <div class="row no-gutters">
                                    <div class="col-lg-9 col-md-8">
                                        <div class="newsletter_field">
                                            <input type="email" placeholder="Your mail" >
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-4">
                                        <div class="newsletter_btn">
                                            <button class="boxed-btn4 " type="submit" >Subscribe</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- newletter_area_end  -->


    @endsection
