<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Payment;
use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function metodePembayaran()
    {
        if (request('metode')) {
            if (request('mulai')) {
                if (request('sampai')) {
                }
            }
            $reports = Payment::where('id', request('metode'))->get();
        }
        return view('admin.report.metode');
    }
}
