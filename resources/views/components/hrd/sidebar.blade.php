<ul>
    <li class="menu-title">Main</li>
    <li class="{{ request()->is('dashboard*') ? 'active' : '' }}">
        <a href="/dashboard"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a>
    </li>
    <li class="{{ (request()->is('hrd/appointment*')) ? 'active' : '' }}">
        <a href="{{ route('hrd.appointments.index') }}"><i class="fa fa-table"></i> <span>Appointment</span></a>
    </li>
    <li class="{{ (request()->is('hrd/report*')) ? 'active' : '' }}">
        <a href="{{ route('hrd.report.index') }}"><i class="fa fa-book" aria-hidden="true"></i> <span>Report</span></a>
    </li>
</ul>