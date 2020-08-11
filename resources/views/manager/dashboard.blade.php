@extends('layouts.managerDashboard')
@section('content')
    <!-- ZONA DIN DREAPTA-->
    <div class="row mt-5">
        <div class="col-md-12">
            <h3>Bun venit, {{Auth::user()->name}}</h3>
            <p class="mt-5">Din zona "Dashboard" poti controla si edita toate detaliile legate de contul tau.<br>
                Asigura-te ca ai verificat foarte bine detaliile unui student inainte sa programezi un interviu.
            </p>
        </div>
    </div>
@endsection
