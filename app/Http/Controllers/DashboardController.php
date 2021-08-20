<?php

namespace App\Http\Controllers;

use App\User;

class DashboardController extends Controller
{
    public function index()
    {
        $macAddr = substr(exec('getmac'), 0, 17);

        if (auth()->user()->mac_address == null) {
            $user = User::find(auth()->user()->id);
            $user->update([
                'mac_address' => $macAddr
            ]);
        }

        return view('dashboard.index');
    }

    public function profile()
    {
        $profile = User::with('roles')->find(auth()->user()->id);
        return view('dashboard.profile', compact('profile'));
    }
}
