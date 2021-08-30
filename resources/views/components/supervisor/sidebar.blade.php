<ul>
    <li class="menu-title">Main</li>
    @can('appointment-access')
    <li class="{{ request()->is('supervisor/appointments*') ? 'active' : '' }}">
        <a href="{{ route('supervisor.appointments.index') }}"><i class="fa fa-calendar"></i> <span>Appointments</span></a>
    </li>
    @endcan
</ul>