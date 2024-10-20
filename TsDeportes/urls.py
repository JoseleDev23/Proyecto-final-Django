from django.urls import path
from .views import login_view, signup_view
from django.contrib.auth.views import LogoutView
from . import views

app_name = "TsDeportes"

urlpatterns = [
    
    path('login/', login_view, name='login'),
    path('signup/', signup_view, name='signup'),
    path('logout/', login_view, name='logout'),
    path('carrusel/', views.carrusel, name='carrusel'),
    
    path("muestraEquipos/", views.muestraEquipos, name="Equipos"),
    path('modificarEquipo/<int:pk>/', views.ModificarEquipo.as_view(), name='modificar_equipo'),
    path('borrarEquipo/<int:pk>/', views.BorrarEquipo.as_view(), name='borrar_equipo'),
    path('nuevoEquipo/', views.NuevoEquipo.as_view(), name='nuevo_equipo'),
    path('detallesEquipo/<int:pk>/', views.DetalleEquipo.as_view(), name='detalle_equipo'),
    
    path("muestraDeportes/", views.muestraDeportes, name = "Deportes"),
    path("nuevoDeporte/",views.NuevoDeporte.as_view(), name="nuevo_deporte"),
    path("modificarDeporte/<int:pk>/",views.ModificarDeporte.as_view(), name="modificar_deporte"),
    path("borrarDeporte/<int:pk>/", views.BorrarDeporte.as_view(), name="borrar_deporte"),
    
    path("instalaciones/", views.muestraInstalaciones, name="instalaciones"),
    path("nuevaInstalacion/", views.NuevaInstalacion.as_view(), name="nueva_instalacion"),
    path("modificarInstalacion/<int:pk>/", views.ModificarInstalacion.as_view(), name="modificar_instalacion"),
    path("borrarInstalacion/<int:pk>/", views.BorrarInstalacion.as_view(), name="borrar_instalacion"),

    path("muestraJugadores/", views.muestraJugadores, name="jugadores"),
    path('modificarJugador/<int:pk>/', views.ModificarJugador.as_view(), name='modificar_jugador'),
    path('borrarJugador/<int:pk>/', views.BorrarJugador.as_view(), name='borrar_jugador'),
    path('nuevoJugador/', views.NuevoJugador.as_view(), name='nuevo_jugador'),
    path('detallesJugador/<int:pk>/', views.DetallesJugador.as_view(), name='detalles_jugador'),
    
    path('muestraPartidos/', views.muestraPartidos, name='partidos'),
    path('detallesPartido/<int:pk>/', views.DetallesPartido.as_view(), name='detalles_partido'),
    path('modificarPartido/<int:pk>/', views.ModificarPartido.as_view(), name='modificar_partido'),
    path('borrarPartido/<int:pk>/', views.BorrarPartido.as_view(), name='borrar_partido'),
    path('nuevoPartido/', views.NuevoPartido.as_view(), name='nuevo_partido'),
    
    
]