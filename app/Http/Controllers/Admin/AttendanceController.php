<?php

namespace App\Http\Controllers\Admin;

use App\Cabang;
use App\Holidays;
use App\Http\Controllers\Controller;
use App\Jadwal;
use App\Ruangan;
use App\Shift;
use App\User;
use Carbon\Carbon;
use Exception;
use Illuminate\Database\Eloquent\Collection;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class AttendanceController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    private $array = [];
    public function index()
    {
        $user = User::whereHas('roles', function ($e) {
            return $e->where('name', 'dokter');
        })->orWhereHas('roles', function ($qr) {
            return $qr->where('name', 'perawat');
        })->orWhereHas('roles', function ($qr) {
            return $qr->where('name', 'office-boy');
        })->whereHas('jadwal', function ($q) {
            return $q->whereMonth('tanggal', Carbon::now()->format('m'))->whereYear('tanggal', Carbon::now()->format('Y'));
        })->get();
        $bulan = Carbon::now()->format('m');
        $tahun = Carbon::now()->format('Y');
        return view('admin.attendance.index', [
            'user' => $user,
            'user_mode' => User::latest()->get(),
            'holiday' => Holidays::whereMonth('holiday_date', Carbon::now()->format('m'))->get(),
            'last_date' => Carbon::now()->endOfMonth()->format('d'),
            'cabangs' => Cabang::get(),
            'ruangans' => Ruangan::get(),
            'shift' => Shift::pluck('kode'),
            'bulan' => $bulan,
            'tahun' => $tahun
        ]);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.attendance.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $bulan = Carbon::now()->format('m');
        $tahun = Carbon::now()->format('Y');
        $tanggal_akhir = Carbon::now()->endOfMonth()->format('d');
        $holiday = Holidays::whereMonth('holiday_date', $bulan)->pluck('holiday_date');

        if (isset($request->SF1)) {
            for ($i = 0; $i < count($request->SF1); $i++) {
                if (in_array($request->SF1[$i], $holiday->toArray())) {
                    return back()->with('error', 'Hari Libur');
                }
            }
        }

        if (isset($request->SF2)) {
            for ($i = 0; $i < count($request->SF2); $i++) {
                if (in_array($request->SF2[$i], $holiday->toArray())) {
                    return back()->with('error', 'Hari Libur');
                }
            }
        }

        if (Jadwal::where('user_id', $request->user_id)->whereMonth('tanggal', Carbon::now()->format('m'))->count() < Carbon::now()->endOfMonth()->format('d') || Jadwal::where('user_id', '=', $request->user_id)->get()->count() == 0) {
            for ($i = 0; $i < $tanggal_akhir; $i++) {
                if (in_array(Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'), $holiday->toArray())) {
                    Jadwal::create([
                        'user_id' => $request->user_id,
                        'tanggal' => Carbon::now()->addDays($i)->format('Y-m-d'),
                        'shift_id' => 3
                    ]);
                } else {
                    Jadwal::create([
                        'user_id' => $request->user_id,
                        'tanggal' => Carbon::now()->addDays($i)->format('Y-m-d'),
                        'shift_id' => 1
                    ]);
                }
            }
            return back()->with('success', 'merefresh data');
        }
        $SF1 = [];
        try {
            if (isset($request->SF1)) {
                for ($i = 0; $i < Carbon::now()->endOfMonth()->format('d'); $i++) {
                    if (in_array(Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'), $request->SF1)) {
                        echo Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d') . ' yang di pilih <br>';
                        Jadwal::where('user_id', $request->user_id)->whereDate('tanggal', Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'))->update([
                            'ruangan_id' => $request->ruangan_id,
                            'shift_id' => 1
                        ]);
                        if (Jadwal::where('user_id', $request->user_id)->whereDate('tanggal', Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'))->where('shift_id', 1)->get()->count() > 1) {
                            Jadwal::where('user_id', $request->user_id)->whereDate('tanggal', Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'))->where('shift_id', 1)->first()->delete();
                        }
                        array_push($SF1, Jadwal::where('user_id', $request->user_id)->whereDate('tanggal', Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'))->first());
                    } else {
                        echo Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d') . '<br>';
                    }
                }
            } else {
                if (isset($request->SF2)) {
                    $SF2 = [];
                    $update = array_diff($request->SF2, $SF2);
                    $update = array_values($update);

                    for ($i = 0; $i < Carbon::now()->endOfMonth()->format('d'); $i++) {
                        if (in_array(Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'), $update)) {
                            echo Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d') . '  yang di pilih  SF2 <br>';
                            Jadwal::where('user_id', $request->user_id)->whereDate('tanggal', Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'))->update([
                                'ruangan_id' => $request->ruangan_id,
                                'shift_id' => 2
                            ]);
                            if (Jadwal::where('user_id', $request->user_id)->whereDate('tanggal', Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'))->where('shift_id', 2)->get()->count() > 1) {
                                Jadwal::where('user_id', $request->user_id)->whereDate('tanggal', Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'))->where('shift_id', 2)->first()->delete();
                            }
                        } else {
                            echo Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d') . ' <br>';
                        }
                    }
                }
                if (isset($request->L)) {
                    for ($i = 0; $i < Carbon::now()->endOfMonth()->format('d'); $i++) {
                        if (in_array(Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'), $request->L)) {
                            Jadwal::where('user_id', $request->user_id)->whereDate('tanggal', Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'))->update([
                                'ruangan_id' => $request->ruangan_id,
                                'shift_id' => 3,
                            ]);
                            if (Jadwal::where('user_id', $request->user_id)->where('tanggal', Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'))->where('shift_id', 3)->get()->count() > 1) {
                                Jadwal::where('user_id', $request->user_id)->where('tanggal', Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'))->where('shift_id', 3)->first()->delete();
                            }
                        }
                    }
                }
                return back();
            }
            $SF2 = [];
            if (isset($request->SF2)) {
                for ($i = 0; $i < Carbon::now()->endOfMonth()->format('d'); $i++) {
                    if (in_array(Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'), $request->SF1) && in_array(Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'), $request->SF2)) {
                        echo Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d') . 'create SF1 dan SF2 <br>';

                        Jadwal::create([
                            'user_id' => $request->user_id,
                            'cabang_id' => $request->cabang_id,
                            'shift_id' => 2,
                            'ruangan_id' => $request->ruangan_id,
                            'tanggal' => Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d')
                        ]);

                        array_push($SF2, Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'));
                    } else {
                        echo Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d') . ' <br>';
                    }
                }

                $update = array_diff($request->SF2, $SF2);
                $update = array_values($update);

                for ($i = 0; $i < Carbon::now()->endOfMonth()->format('d'); $i++) {
                    if (in_array(Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'), $update)) {
                        echo Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d') . '  yang di pilih  SF2 <br>';
                        Jadwal::where('user_id', $request->user_id)->whereDate('tanggal', Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'))->update([
                            'ruangan_id' => $request->ruangan_id,
                            'shift_id' => 2
                        ]);
                        if (Jadwal::where('user_id', $request->user_id)->whereDate('tanggal', Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'))->where('shift_id', 2)->get()->count() > 1) {
                            Jadwal::where('user_id', $request->user_id)->whereDate('tanggal', Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'))->where('shift_id', 2)->first()->delete();
                        }
                    } else {
                        echo Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d') . ' <br>';
                    }
                }
                for ($i = 0; $i < count($SF2); $i++) {
                    if (in_array($SF2[$i], $request->SF2)) {
                        echo 'hapus' . $SF2[$i];
                    } else {
                        echo 'gg';
                    }
                }
            }
            if (isset($request->L)) {
                for ($i = 0; $i < Carbon::now()->endOfMonth()->format('d'); $i++) {
                    if (in_array(Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'), $request->L)) {
                        Jadwal::where('user_id', $request->user_id)->whereDate('tanggal', Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'))->update([
                            'ruangan_id' => $request->ruangan_id,
                            'shift_id' => 3,
                        ]);
                        if (Jadwal::where('user_id', $request->user_id)->where('tanggal', Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'))->where('shift_id', 3)->get()->count() > 1) {
                            Jadwal::where('user_id', $request->user_id)->where('tanggal', Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'))->where('shift_id', 3)->first()->delete();
                        }
                    }
                }
            }

            return back()->with('success', 'Berhasil Mengupdate Attendance');
        } catch (Exception $err) {
            return back()->with('error', $err->getMessage());
            // echo $err->getMessage();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */

    public function show($id)
    {
        $user = User::find($id);
        $json = [
            'name' => $user->name,
            'cabang_id' => $user->cabang_id,
            'cabang' => $user->cabang->nama,
            'ruangan' => Ruangan::where('cabang_id', $user->cabang_id)->get()
        ];
        return response()->json($json);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    private function cek($row)
    {
        $bulan = Carbon::now()->format('m');
        $tanggal_akhir = Carbon::now()->endOfMonth()->format('d');
        $holiday = Holidays::whereMonth('holiday_date', $bulan)->pluck('holiday_date');

        for ($i = 0; $i < $tanggal_akhir; $i++) {
            if (in_array(Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'), $holiday->toArray())) {
                return 'disabled';
            } else {
                return 'checked';
            }
        }
    }
    private function tanggal($user)
    {
        return $user;
    }
    private function kode($user, $tanggal)
    {
        $array = [];
        foreach ($user->where('tanggal', $tanggal) as $data) {
            array_push($array, $data->kode);
        }
        return $array;
    }
    private function cabang($user, $tanggal)
    {
        $array = [];
        foreach ($user->where('tanggal', $tanggal) as $data) {
            array_push($array, $data->cabang);
        }
        return $array;
    }
    private function ruang($user, $tanggal)
    {
        $array = [];
        foreach ($user->where('tanggal', $tanggal) as $data) {
            array_push($array, $data->ruang);
        }
        return $array;
    }
    public function update_user($month, $year)
    {
        // $jadwal = User::doesntHave('jadwal')
        // ->whereHas('roles', function($qr){
        //     return $qr->whereIn('name', ['dokter', 'office-boy', 'perawat']);
        // })
        // ->get();
        // dd($jadwal);
        try {
            $user = User::whereHas('roles', function ($qr) {
                return $qr->whereIn('name', ['dokter ', 'office-boy', 'perawat']);
            })->whereDoesntHave('jadwal', function ($re) use ($month, $year) {
                return $re->whereMonth('tanggal', $month)->whereYear('tanggal', $year);
            })->get();

            // $count = User::doesntHave('jadwal')->whereHas('roles', function($qr){
            //     return $qr->whereIn('name', ['dokter', 'office-boy', 'perawat']);
            // })->get()->count();
            // if($count == 0){
            //     $user = User::whereHas('roles', function($qr ){
            //         return $qr->whereIn('name',['dokter', 'office-boy', 'perawat']);
            //     })->get();
            // }else{ 
            //     $user = User::whereHas('roles',function($qr){
            //         return $qr->whereIn('name', ['dokter', 'office-boy', 'perawat']);
            //     })->get();
            // }
            foreach ($user as $data) {
                $bulan = Carbon::parse($year . '-' . $month)->format('m');
                $tanggal_akhir = Carbon::parse($year . '-' . $month)->endOfMonth()->format('d');
                $holiday = Holidays::whereMonth('holiday_date', $bulan)->pluck('holiday_date');

                Jadwal::where('user_id', $data->id)->whereMonth('tanggal', Carbon::parse($year . '-' . $month)->format('m'))->delete();
                // dd(Jadwal::where('user_id', $id)->get());
                for ($i = 0; $i < $tanggal_akhir; $i++) {
                    if (in_array(Carbon::parse($year . '-' . $month)->startOfMonth()->addDays($i)->format('Y-m-d'), $holiday->toArray())) {
                        Jadwal::create([
                            'user_id' => $data->id,
                            'tanggal' => Carbon::parse($year . '-' . $month)->startOfMonth()->addDays($i)->format('Y-m-d'),
                            'cabang_id' => $data->cabang_id,
                            'ruangan_id' => $data->cabang->ruangan->first()->id,
                            'shift_id' => 3
                        ]);
                    } else {
                        Jadwal::create([
                            'user_id' => $data->id,
                            'tanggal' => Carbon::parse($year . '-' . $month)->startOfMonth()->addDays($i)->format('Y-m-d'),
                            'cabang_id' => $data->cabang_id,
                            'ruangan_id' => $data->cabang->ruangan->first()->id,
                            'shift_id' => 1
                        ]);
                    }
                }
            }

            return back()->with('success', 'Berhasil Mengupdate Data Jadwal ' . Carbon::parse($year . '-' . $month)->format('Y M') . ' => ' . $user->pluck('name') . ', => ' . Jadwal::get()->count());
        } catch (Exception $err) {
            return back()->with('error', $err->getMessage());
        }
    }
    public function edit($id)
    {
        try {
            $collection = new Collection();
            $shift = Shift::pluck('kode');
            $user = DB::table('users')
                ->join('jadwals', 'jadwals.user_id', '=', 'users.id')
                ->join('shifts', 'shifts.id', '=', 'jadwals.shift_id')
                ->join('cabangs', 'cabangs.id', '=', 'jadwals.cabang_id')
                ->join('ruangans', 'ruangans.id', '=', 'jadwals.ruangan_id')
                ->select([
                    'jadwals.tanggal as tanggal',
                ])
                ->where('jadwals.user_id', $id)
                ->whereYear('jadwals.tanggal', Carbon::now()->format('Y'))
                ->whereMonth('jadwals.tanggal', Carbon::now()->format('m'))
                ->orderBy('tanggal')
                ->distinct()
                ->get();
            $child = DB::table('users')
                ->join('jadwals', 'jadwals.user_id', '=', 'users.id')
                ->join('shifts', 'shifts.id', '=', 'jadwals.shift_id')
                ->join('cabangs', 'cabangs.id', '=', 'jadwals.cabang_id')
                ->join('ruangans', 'ruangans.id', '=', 'jadwals.ruangan_id')
                ->select([
                    'jadwals.tanggal as tanggal',
                    'shifts.kode as kode',
                    'cabangs.nama as cabang',
                    'ruangans.nama_ruangan as ruang',
                ])
                ->where('jadwals.user_id', $id)
                ->whereYear('jadwals.tanggal', Carbon::now()->format('Y'))
                ->whereMonth('jadwals.tanggal', Carbon::now()->format('m'))
                ->get();
            $a = 1;
            $i = 0;
            foreach ($user as $data) {
                $collection->push((object)[
                    'id' => $i++,
                    'no' => $a++,
                    'tanggal' => $this->tanggal($data->tanggal),
                    'kode' => $this->kode($child, $data->tanggal),
                    'cabang' => $this->cabang($child, $data->tanggal),
                    'ruang' => $this->ruang($child, $data->tanggal)
                ]);
            }
            $datatable =  datatables()->of($collection);

            $bulan = Carbon::now()->format('m');
            $tanggal_akhir = Carbon::now()->endOfMonth()->format('d');
            $holiday = Holidays::whereMonth('holiday_date', $bulan)->pluck('holiday_date');

            foreach ($shift as $row) {
                for ($i = 0; $i < $tanggal_akhir; $i++) {
                    if (in_array(Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'), $holiday->toArray())) {
                        $datatable->editColumn($row, function ($data) use ($row, $id) {
                            return '<input type="checkbox" name="' . $row . '[]" value="' . $data->tanggal . '">';
                        });
                    } else {
                        $datatable->editColumn($row, function ($data) use ($row, $id) {
                            return '<input type="checkbox" name="' . $row . '[]" value="' . $data->tanggal . '">';
                        });
                    }
                }
            }

            $option = Shift::pluck('kode')->toArray();
            return $datatable
                ->addIndexColumn()
                ->rawColumns(array_values($option))
                ->make();
        } catch (Exception $err) {
            return response()->json($err->getMessage());
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            $bulan = Carbon::now()->format('m');
            $tanggal_akhir = Carbon::now()->endOfMonth()->format('d');
            $holiday = Holidays::whereMonth('holiday_date', $bulan)->pluck('holiday_date');
            $user = User::findOrFail($id);
            Jadwal::where('user_id', $id)->whereMonth('tanggal', Carbon::now()->format('m'))->delete();
            // dd(Jadwal::where('user_id', $id)->get());
            for ($i = 0; $i < $tanggal_akhir; $i++) {
                if (in_array(Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'), $holiday->toArray())) {
                    Jadwal::create([
                        'user_id' => $id,
                        'tanggal' => Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'),
                        'cabang_id' => $user->cabang_id,
                        'ruangan_id' => $user->cabang->ruangan->first()->id,
                        'shift_id' => 3
                    ]);
                } else {
                    Jadwal::create([
                        'user_id' => $id,
                        'tanggal' => Carbon::now()->startOfMonth()->addDays($i)->format('Y-m-d'),
                        'cabang_id' => $user->cabang_id,
                        'ruangan_id' => $user->cabang->ruangan->first()->id,
                        'shift_id' => 1
                    ]);
                }
            }
            return back()->with('success', 'Berhasil Mereset Data Jadwal ' . Carbon::now()->format('Y - M') . ', pada user ' . $user->name);
        } catch (Exception $err) {
            return back()->with('error', $err->getMessage());
        }
    }

    public function search(Request $request)
    {
        $pegawai = $request->pegawai;
        $month = $request->month;
        $year = $request->year;
        if (!$request->month) {
            $month = Carbon::now()->format('m');
        }
        if (!$request->year) {
            $year = Carbon::now()->format('Y');
        }
        $last_date = Carbon::parse($year . '-' . $month)->endOfMonth()->format('d');
        if ($year == null && $month == null) {
            $user = User::where('name', 'like', '%' . $pegawai . '%')->get();
        } elseif ($year == '') {
            $user = User::where('name', 'like', '%' . $pegawai . '%')->whereHas('jadwal', function ($q) use ($month, $year) {
                return $q->whereMonth('tanggal', $month);
            })->get();
        } elseif ($month == '') {
            $user = User::where('name', 'like', '%' . $pegawai . '%')->whereHas('jadwal', function ($q) use ($month, $year) {
                return $q->whereYear('tanggal', $year);
            })->get();
        } else {
            $user = User::where('name', 'like', '%' . $pegawai . '%')->whereHas('jadwal', function ($q) use ($month, $year) {
                return $q->whereMonth('tanggal', $month)->whereYear('tanggal', $year);
            })->get();
        }
        return view('admin.attendance.index',    [
            'date' => $request->all(),
            'user' => $user,
            'holiday' => Holidays::whereMonth('holiday_date', $month)->get(),
            'last_date' => $last_date,
            'cabangs' => Cabang::get(),
            'ruangans' => Ruangan::get(),
            'shift' => Shift::pluck('kode'),
            'bulan' => $month,
            'tahun' => $year
        ]);
    }
}
