@extends('layouts.app')

@section('content')

    <div class="row checkerClass">
        <div class="col-md-6 mt-10 mg-center ">
            <h1>Please provide the bank issued token</h1>
            <p>This way we can verify that you paid the membership tax</p>
            <form action="{{ route('checkPayment') }}" method="POST">
                @csrf
                <input type="text" class="form-control" name="token" placeholder="token">
                @if ($errors->any())
                    <p class="text-danger">{{$errors->first()}}</p>
                @endif
                <button class="btn-lg btn-info mt-10" type="submit">Verify</button>
            </form>
        </div>
    </div>

    @endsection
