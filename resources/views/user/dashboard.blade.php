@extends('layouts.studentDashboard')
@section('content')
            <!-- ZONA DIN DREAPTA-->
                <div class="row mt-5">
                    <div class="col-md-12">
                        <h3>Bun venit, {{Auth::user()->name}}</h3>
                        <p class="mt-5">Din zona "Dashboard" poti controla si edita toate detaliile legate de contul tau.<br>
                            Daca intampini probleme poti oricand sa ne trimiti un email la adresa din pagina de Contact.
                        </p>
                    </div>
                </div>
@endsection
