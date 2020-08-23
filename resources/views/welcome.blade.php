@extends('layouts.app')
@section('content')
<div class="slider_area">
    <div class="slider_active owl-carousel">
        <div class="single_slider  d-flex align-items-center slider_bg_1 overlay">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-12 col-md-12">
                        <div class="slider_text text-center">
                            <h3>America</h3>
                            <p>Traieste visul American si distreaza-te alaturi de prietenii tai</p>
                            <a href="#" class="boxed-btn3">Explore Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="single_slider  d-flex align-items-center slider_bg_2 overlay">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-12 col-md-12">
                        <div class="slider_text text-center">
                            <h3>America</h3>
                            <p>Traieste visul American si distreaza-te alaturi de prietenii tai</p>
                            <a href="#" class="boxed-btn3">Explore Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="single_slider  d-flex align-items-center slider_bg_3 overlay">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-xl-12 col-md-12">
                        <div class="slider_text text-center">
                            <h3>Switzerland</h3>
                            <p>Pixel perfect design with awesome contents</p>
                            <a href="#" class="boxed-btn3">Explore Now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<!-- slider_area_end -->

<!-- where_togo_area_start
<div class="where_togo_area">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-3">
                <div class="form_area">
                    <h3>What's your type?!</h3>
                </div>
            </div>
            <div class="col-lg-9">
                <div class="search_wrap">
                    <form class="search_form" action="#">
                        <div class="input_field">
                            <input type="text" placeholder="Where to go?">
                        </div>
                        <div class="input_field">
                            <input id="datepicker" placeholder="Date">
                        </div>
                        <div class="search_btn">
                            <button class="boxed-btn4 " type="submit" >Search</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
where_togo_area_end  -->

<!-- popular_destination_area_start  -->

<div class="popular_places_area">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <form action="{{route('searchJob')}}" method="post">
                    @csrf
                    <div class="row">
                        <div class="col-md-12">
                            <h4>Cauta jobul mult visat</h4>
                        </div>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="searchQuery">
                        </div>
                        <div class="col-md-3">
                            <button type="submit" class="btn btn-info">Cauta</button>
                        </div>
                        <div class="col-md-12">
                            <a class="btn btn-primary mt-2" data-toggle="collapse" href="#collapseExample"  aria-expanded="false" aria-controls="collapseExample">
                                Filtre
                            </a>
                            <div class="collapse" id="collapseExample">
                                <div class="card card-body mt-3">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="minWage">Plata / ora (min)</label>
                                                <input type="number" name="minWage" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="maxHrs">Ore de lucru (max/sapt)</label>
                                                <input type="number" name="maxHrs" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="region">Regiune</label>
                                                <select name="region" id="regionSelect" class="form-control">
                                                    <option value="Hawaii">Hawaii</option>
                                                    <option value="Hawaii">Chicago</option>
                                                    <option value="Hawaii">Buzau</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-lg-6 mt-5">
                <div class="section_title text-center mb_70">
                    @if(isset($data->fromSearch))
                        <h3>Rezultate Cautare</h3>
                    @else
                        <h3>Joburi Populare</h3>
                    @endif


                    <p>Cele mai ravnite joburi la un click distanta de tine! Aplica acum si traieste visul American!</p>
                </div>
            </div>
        </div>
        <div class="row">
           @foreach($data->jobsData as $jd)
                <div class="col-lg-4 col-md-6">
                    @if(count($data->jobsData)==0)
                        <div class="alert alert-primary" role="alert" id="alert">
                            <h2>Din pacate nu am gasit un job care sa se potriveasca cu criteriile tale.</h2>
                        </div>
                    @endif
                    <div class="single_place">
                        <div class="thumb">
                            <img src="@if(isset($jd->image_path)){{$jd->image_path}}@else{{asset('img/noimage.png')}}@endif" alt="">
                            <a href="#" class="prise">${{$jd->rate}}/ora</a>
                        </div>
                        <div class="place_info">
                            <a href="destination_details.html"><h3>{{$jd->title}}</h3></a>
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



        </div>
        <!--<div class="row">
            <div class="col-lg-12">
                <div class="more_place_btn text-center">
                    <a class="boxed-btn4" href="#">More Places</a>
                </div>
            </div>
        </div>-->
    </div>
</div>
<!-- Popular jobs end-->

@endsection
