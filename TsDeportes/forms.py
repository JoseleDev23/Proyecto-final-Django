from django import forms
from . import models

class DeporteForm(forms.ModelForm):
    class Meta:
        model = models.Deportes
        fields = ["nombre"]
        widgets = {
            "nombre": forms.TextInput(attrs={"class": "form-control"}),
        }

class InstalacionForm(forms.ModelForm):
    class Meta:
        model = models.Instalaciones
        fields = ["nombre", "direccion", "iluminacion", "cubierta"]
        widgets = {
            "nombre": forms.TextInput(attrs={"class": "form-control"}),
            "direccion": forms.TextInput(attrs={"class": "form-control"}),
            "iluminacion   ": forms.CheckboxInput(attrs={"class": "form-check-input"}),
            "cubierta   ": forms.CheckboxInput(attrs={"class": "form-check-input"}),
        }

class EquipoForm(forms.ModelForm):
    class Meta:
        model = models.Equipo
        fields = ['nombre', 'id_deporte', 'equipacion_principal', 'equipacion_suplente', 'contacto', 'telefono', 'email']

        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control'}),
            'id_deporte': forms.Select(attrs={'class': 'form-control'}),
            'equipacion_principal': forms.TextInput(attrs={'class': 'form-control'}),
            'equipacion_suplente': forms.TextInput(attrs={'class': 'form-control'}),
            'contacto': forms.TextInput(attrs={'class': 'form-control'}),
            'telefono': forms.TextInput(attrs={'class': 'form-control'}),
            'email': forms.EmailInput(attrs={'class': 'form-control'}),
        }

class JugadorForm(forms.ModelForm):
    class Meta:
        model = models.Jugador
        fields = ['nombre', 'apellido1', 'apellido2', 'dorsal', 'fecha_nacimiento', 'altura', 'peso', 'telefono']
        

class JugadorForm(forms.ModelForm):
    class Meta:
        model = models.Jugador
        fields = '__all__'
        
class PartidoForm(forms.ModelForm):
    class Meta:
        model = models.Partido
        fields = '__all__'
        widgets = {
            'fecha_hora': forms.DateTimeInput(attrs={'type': 'datetime-local'}),
        }

    def clean(self):
        cleaned_data = super().clean()
        id_local = cleaned_data.get('id_local')
        id_visitante = cleaned_data.get('id_visitante')

        if id_local == id_visitante:
            raise forms.ValidationError("El mismo equipo no puede ser local y visitante en un partido.")
        return cleaned_data