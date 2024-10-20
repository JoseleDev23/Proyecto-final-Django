from django.shortcuts import render
from django.views import generic
from . import models
from . import forms
from django.shortcuts import redirect
from django.urls import reverse_lazy
from django.views.generic.edit import UpdateView
from django.shortcuts import redirect
import os
from django.conf import settings
from django.utils import timezone

# INSTALACION DE LAS VIEWS PARA LAS DEPORTES: -------------------------------------------------------------------------------------------------------

def muestraDeportes(request):
    deportes = models.Deportes.objects.all()
    context = {'deportes': deportes, 'object_list': deportes}
    return render(request, "deportes.html", context)

class NuevoDeporte(generic.CreateView):
    model = models.Deportes
    form_class = forms.DeporteForm
    template_name = "nuevoDeporte.html"
    success_url = reverse_lazy("TsDeportes:Deportes")

class BorrarDeporte(generic.DeleteView):
    model = models.Deportes
    template_name = "borrarDeporte.html"
    success_url = reverse_lazy("TsDeportes:Deportes")

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        deporte_actual = self.object  # Obtener el deporte actual
        context["nombre_deporte"] = deporte_actual.nombre
        return context

class ModificarDeporte(generic.UpdateView):
    model = models.Deportes
    form_class = forms.DeporteForm
    template_name = "modificarDeporte.html"
    success_url = reverse_lazy("TsDeportes:Deportes")

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['deportes'] = models.Deportes.objects.all()
        return context


# INSTALACION DE LAS VIEWS PARA LAS INSTALACIONES: -------------------------------------------------------------------------------------------------------

def muestraInstalaciones(request):
    instalaciones = models.Instalaciones.objects.all()
    context = {'instalaciones': instalaciones, 'object_list': instalaciones}
    return render(request, "instalaciones.html", context)

class NuevaInstalacion(generic.CreateView):
    model = models.Instalaciones
    form_class = forms.InstalacionForm
    template_name = "nuevaInstalacion.html"
    success_url = reverse_lazy("TsDeportes:instalaciones")

class BorrarInstalacion(generic.DeleteView):
    model = models.Instalaciones
    template_name = "borrarInstalacion.html"
    success_url = reverse_lazy("TsDeportes:instalaciones")

    def get_context_data(self, **kwargs):
        context = super(BorrarInstalacion, self).get_context_data(**kwargs)
        context["Instalaciones"] = models.Instalaciones.objects.all()
        return context

class ModificarInstalacion(UpdateView):
    model = models.Instalaciones
    form_class = forms.InstalacionForm
    template_name = "modificarInstalacion.html"
    success_url = reverse_lazy("TsDeportes:instalaciones")

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['instalaciones'] = models.Instalaciones.objects.all()
        return context

# INSTALACION DE LAS VIEWS PARA LOS EQUIPOS: -------------------------------------------------------------------------------------------------------

def muestraEquipos(request):
    equipos = models.Equipo.objects.all()
    context = {'equipos': equipos, 'object_list': equipos}
    return render(request, "equipos.html", context)

class ModificarEquipo(UpdateView):
    model = models.Equipo
    form_class = forms.EquipoForm
    template_name = 'modificarEquipo.html'
    success_url = "/TsDeportes/muestraEquipos/"

class BorrarEquipo(generic.DeleteView):
    model = models.Equipo
    template_name = 'borrarEquipo.html'
    success_url = "/TsDeportes/muestraEquipos/"

class NuevoEquipo(generic.CreateView):
    model = models.Equipo
    form_class = forms.EquipoForm
    template_name = 'nuevoEquipo.html'
    success_url = "/TsDeportes/muestraEquipos/"

class DetalleEquipo(generic.DetailView):
    model = models.Equipo
    template_name = 'detallesEquipo.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        equipo = self.get_object()
        context['jugadores'] = models.Jugador.objects.filter(id_equipo=equipo).order_by('dorsal')
        return context

# INSTALACION DE LAS VIEWS PARA LOS JUGADORES: -------------------------------------------------------------------------------------------------------

def muestraJugadores(request):
    jugadores = models.Jugador.objects.all()
    context = {'jugadores': jugadores, 'object_list': jugadores}
    return render(request, "jugadores.html", context)

class ModificarJugador(generic.UpdateView):
    model = models.Jugador
    form_class = forms.JugadorForm
    template_name = 'modificarJugador.html'
    success_url = reverse_lazy('TsDeportes:jugadores')

class BorrarJugador(generic.DeleteView):
    model = models.Jugador
    template_name = 'borrarJugador.html'
    success_url = reverse_lazy('TsDeportes:jugadores')

class NuevoJugador(generic.CreateView):
    model = models.Jugador
    form_class = forms.JugadorForm
    template_name = 'nuevoJugador.html'
    success_url = reverse_lazy('TsDeportes:jugadores')

class DetallesJugador(generic.View):
    template_name = 'detallesJugador.html'

    def get(self, request, pk):
        jugador = models.Jugador.objects.get(pk=pk)
        context = {'jugador': jugador}
        return render(request, self.template_name, context)

# INSTALACION DE LAS VIEWS PARA LOS PARTIDOS: -------------------------------------------------------------------------------------------------------

def muestraPartidos(request):
    partidos = models.Partido.objects.all()
    context = {'partidos': partidos, 'object_list': partidos}
    return render(request, "partidos.html", context)

class DetallesPartido(generic.DetailView):
    model = models.Partido
    template_name = 'detallesPartido.html'

class ModificarPartido(generic.UpdateView):
    model = models.Partido
    form_class = forms.PartidoForm
    template_name = 'modificarPartido.html'
    success_url = reverse_lazy('TsDeportes:muestraPartidos')

class BorrarPartido(generic.DeleteView):
    model = models.Partido
    template_name = 'borrarPartido.html'
    success_url = reverse_lazy('TsDeportes:partidos')

class NuevoPartido(generic.CreateView):
    model = models.Partido
    form_class = forms.PartidoForm
    template_name = 'nuevoPartido.html'
    success_url = reverse_lazy('TsDeportes:muestraPartidos')
    
# INSTALACION DE LA VIEW PARA EL CARRUSEL: -------------------------------------------------------------------------------------------------------

def carrusel(request):
    # Ruta a la carpeta de imágenes
    img_folder = os.path.join(settings.STATIC_ROOT, 'img')

    # Obtener una lista de nombres de archivos en la carpeta de imágenes
    imagenes = [img for img in os.listdir(img_folder) if img.endswith(".jpg")]

    # Obtener los últimos cinco partidos
    ultimos_partidos = models.Partido.objects.filter(fecha_hora__lte=timezone.now()).order_by('-fecha_hora')[:5]

    # Obtener los próximos cinco partidos
    proximos_partidos = models.Partido.objects.filter(fecha_hora__gt=timezone.now()).order_by('fecha_hora')[:5]

    # Pasar la lista de imágenes y los partidos al contexto
    context = {'imagenes': imagenes, 'ultimos_partidos': ultimos_partidos, 'proximos_partidos': proximos_partidos}
    
    return render(request, 'carrusel.html', context)


# INSTALACION DE LA VIEW PARA EL LOGIN: -------------------------------------------------------------------------------------------------------

from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth import login

def login_view(request):
    if request.method == 'POST':
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            user = form.get_user()
            login(request, user)
            return redirect("/TsDeportes/carrusel/")
    else:
        form = AuthenticationForm(request)

    return render(request, 'login.html', {'form': form})

def signup_view(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect("/TsDeportes/carrusel/")
    else:
        form = UserCreationForm()

    return render(request, 'signup.html', {'form': form})