<div class="row">
    <div class="col-md-12">
        <div class="table-responsive">
            <table class="table table-striped table-bordered custom-table report">
                <thead>
                    <tr>
                        <th class="text-center">No</th>
                        <th>Nama Pasien</th>
                        <th>Cabang</th>
                        <th>No Appointment</th>
                        <th>Amount</th>
                        <th>Paid</th>
                        <th>Unpaid</th>
                    </tr>
                </thead>
                @php
                $amount = 0;
                $paid = 0;
                $unpaid = 0;
                @endphp
                <tbody>
                    @foreach($appointments as $appoinment)
                    <tr>
                        <td class="text-center">{{ $loop->iteration }}</td>
                        <td>{{ $appoinment->pasien->nama }}</td>
                        <td>{{ $appoinment->cabang->nama }}</td>
                        <td>{{ $appoinment->no_booking }}</td>
                        <td>@currency($appoinment->tindakan->sum('nominal')) </td>
                        <td>@currency($appoinment->rincian->sum('dibayar')) </td>
                        <td>@currency($appoinment->tindakan->sum('nominal') - $appoinment->rincian->sum('dibayar')) </td>
                    </tr>
                    @php
                    $amount += $appoinment->tindakan->sum('nominal');
                    $paid += $appoinment->rincian->sum('dibayar');
                    $unpaid += $appoinment->tindakan->sum('nominal') - $appoinment->rincian->sum('dibayar');
                    @endphp
                    @endforeach
                </tbody>

                <tfoot>
                    <tr>
                        <td class="text-center"><b>Grand Total</b></td>
                        <td colspan="3"></td>
                        <td>@currency($amount)</td>
                        <td>@currency($paid)</td>
                        <td>@currency($unpaid)</td>
                    </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>