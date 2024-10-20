from django.db import models

class Deportes(models.Model):
    id_deporte = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=50, unique=True, verbose_name="Nombre")
    
    def __str__(self):
        return self.nombre
    
    class Meta:
        verbose_name = "Deporte"
        verbose_name_plural = "Deportes"
        db_table = "deportes"
        app_label = 'TsDeportes'

class Instalaciones(models.Model):
    id_instalacion = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=50, unique=True)
    direccion = models.CharField(max_length=50, verbose_name="Direccion")
    iluminacion = models.BooleanField(verbose_name="Iluminacion", default=False)
    cubierta = models.BooleanField(verbose_name="Cubierta", default=False)
    
    def __str__(self):
        return self.nombre
    
    class Meta:
        verbose_name = "Instalacion"
        verbose_name_plural = "Instalaciones"
        db_table = "instalaciones"
        app_label = 'TsDeportes'

class Equipo(models.Model):
    id_equipo = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=20, unique=True)
    id_deporte = models.ForeignKey(Deportes, db_column= "id_deporte", on_delete=models.RESTRICT)
    equipacion_principal = models.CharField(max_length=100)
    equipacion_suplente = models.CharField(max_length=100)
    contacto = models.CharField(max_length=100)
    telefono = models.CharField(max_length=15)
    email = models.EmailField(max_length=100)
    
    def __str__(self):
        return self.nombre
    
    class Meta:
        verbose_name = "Equipo"
        verbose_name_plural = "Equipos"
        db_table = "equipos"
        app_label = 'TsDeportes'

class Jugador(models.Model):
    id_jugador = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=20)
    apellido1 = models.CharField(max_length=20)
    apellido2 = models.CharField(max_length=20, null=True, blank=True)
    id_equipo =  models.ForeignKey(Equipo, db_column= "id_equipo",on_delete=models.RESTRICT)
    dorsal = models.IntegerField()
    fecha_nacimiento = models.DateField()
    altura = models.DecimalField(max_digits=3, decimal_places=2)
    peso = models.IntegerField()
    telefono = models.CharField(max_length=15)
    
    class Meta:
        verbose_name = "Jugador"
        verbose_name_plural = "Jugadores"
        db_table = "Jugadores"
        app_label = 'TsDeportes'

class Partido(models.Model):
    id_partido = models.AutoField(primary_key=True)
    id_deporte = models.ForeignKey(Deportes, db_column= "id_deporte", on_delete=models.RESTRICT)
    fecha_hora = models.DateTimeField()
    id_instalacion = models.ForeignKey(Instalaciones, db_column= "id_instalacion", on_delete=models.RESTRICT, null=True)
    id_local = models.ForeignKey(Equipo, db_column="id_local", related_name='local_partidos', on_delete=models.RESTRICT)
    id_visitante = models.ForeignKey(Equipo, db_column="id_visitante", related_name='visitante_partidos', on_delete=models.RESTRICT)
    puntos_local = models.IntegerField(null=True)
    puntos_visitante = models.IntegerField(null=True)
    observaciones = models.CharField(max_length=200, null=True)
    
    def __str__(self):
        return self.nombre
    
    class Meta:
        verbose_name = "Partido"
        verbose_name_plural = "Partidos"
        db_table = "partidos"
        app_label = 'TsDeportes'