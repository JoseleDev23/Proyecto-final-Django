from django.contrib import admin
from . import models

class DeporteAdmin(admin.ModelAdmin):
    list_display = ('nombre',)
    search_fields = ('nombre',)

admin.site.register(models.Deportes, DeporteAdmin)

class InstalacionAdmin(admin.ModelAdmin):
    list_display = ('nombre',)
    search_fields = ('nombre',)

admin.site.register(models.Instalaciones, InstalacionAdmin)

class EquipoAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'id_deporte', 'contacto')
    search_fields = ('nombre', 'id_deporte__nombre', 'contacto')

admin.site.register(models.Equipo, EquipoAdmin)

class JugadorAdmin(admin.ModelAdmin):
    list_display = ('nombre', 'apellido1', 'apellido2', 'id_equipo')
    search_fields = ('nombre', 'apellido1', 'apellido2', 'id_equipo__nombre')

admin.site.register(models.Jugador, JugadorAdmin)

class PartidoAdmin(admin.ModelAdmin):
    list_display = ('id_deporte', 'id_instalacion', 'id_local', 'id_visitante')
    search_fields = ('id_deporte__nombre', 'id_instalacion__nombre', 'id_local__nombre', 'id_visitante__nombre')

admin.site.register(models.Partido, PartidoAdmin)