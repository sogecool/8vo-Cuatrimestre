import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, FormsModule],
  templateUrl: './app.component.html',
  styleUrl: './app.component.css'
})
export class AppComponent {
  title = 'Formularios Template-Driven en Angular 18';

  usuario = {
    nombre: '',
    email: '',
    telefono: '',
    tipoConsulta: '',
    mensaje: ''
  };

  onSubmit(form: any) {
    console.log('Formulario enviado:', form.value);
    console.log('Estado del formulario:', form.valid);
    console.log('Datos del usuario:', this.usuario);

    alert('Formulario enviado con éxito. Revisa la consola para ver los datos.');

    form.resetForm();
  }
}
