<?php

namespace App\Http\Middleware;

use App\User;
use Closure;
use Illuminate\Support\Facades\Auth;

class MacAddr
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $macAddr = substr(exec('getmac'), 0, 17);

        if (Auth::user()->mac_address == null) {
            $user = User::find(Auth::user()->id);
            $user->update([
                'mac_address' => $macAddr
            ]);
        } elseif (Auth::user()->mac_address == $macAddr) {
            return $next($request);
        }

        return back();
    }
}
