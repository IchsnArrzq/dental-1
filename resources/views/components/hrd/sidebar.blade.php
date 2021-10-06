<ul>
    <li class="menu-title">Main</li>
    <li class="{{ request()->is('dashboard*') ? 'active' : '' }}">
        <a href="/dashboard"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a>
    </li>
    <li class="{{ (request()->is('hrd/appointment*')) ? 'active' : '' }}">
        <a href="{{ route('hrd.appointments.index') }}"><i class="fa fa-table"></i> <span>Appointment</span></a>
    </li>
</ul>