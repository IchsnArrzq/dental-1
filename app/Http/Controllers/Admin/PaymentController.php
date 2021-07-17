<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\StorePaymentRequest;
use App\Http\Requests\UpdatePaymentRequest;
use App\Payment;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function index()
    {
        $payments = Payment::get();
        return view('admin.payment.index', compact('payments'));
    }

    public function create()
    {
        return view('admin.payment.create');
    }


    public function store(StorePaymentRequest $request)
    {
        Payment::create($request->all());

        return redirect()->route('admin.payments.index')->with('success', 'Payment has been added');
    }

    public function edit(Payment $payment)
    {
        return view('admin.payment.edit', compact('payment'));
    }

    public function update(UpdatePaymentRequest $request, Payment $payment)
    {
        $payment->update($request->all());

        return redirect()->route('admin.payments.index')->with('success', 'Payment has been updated');
    }

    public function destroy(Payment $payment)
    {
        $payment->delete();

        return redirect()->route('admin.payments.index')->with('success', 'Payment has been deleted');
    }
}
