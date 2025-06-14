import { Component } from '@angular/core';
import { CommonModule } from '@angular/common'; // Para *ngFor, date, currency pipes
import { EdadPipe } from './edad.pipe';         // Tu pipe personalizado de edad
import { EstadoPipe } from './estado.pipe';

@Component({
  selector: 'app-root',
  standalone: true, // Indica que este es un componente standalone
  imports: [
    CommonModule, // Necesario para directivas como *ngFor y pipes nativos como date y currency
    EdadPipe,     // Importa tu pipe personalizado de edad
    EstadoPipe    // Importa tu pipe personalizado de estado
  ],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'Portal de Estudiantes';

  // Datos de los estudiantes
  students = [
    {
      nombre: 'Juan Pérez',
      fechaNacimiento: '2005-03-10',
      fechaInscripcion: '2023-09-01',
      pagoMensual: 1200.50,
      calificacion: 85,
      asistencia: 95
    },
    {
      nombre: 'María López',
      fechaNacimiento: '2004-11-25',
      fechaInscripcion: '2023-09-01',
      pagoMensual: 1150.00,
      calificacion: 60,
      asistencia: 78
    },
    {
      nombre: 'Carlos García',
      fechaNacimiento: '2006-01-05',
      fechaInscripcion: '2024-02-15',
      pagoMensual: 1300.75,
      calificacion: 92,
      asistencia: 99
    },
    {
      nombre: 'Sofía Martínez',
      fechaNacimiento: '2003-07-18',
      fechaInscripcion: '2023-09-01',
      pagoMensual: 1250.00,
      calificacion: 70,
      asistencia: 85
    },
    {
      nombre: 'Luis Rodríguez',
      fechaNacimiento: '2005-09-30',
      fechaInscripcion: '2024-02-15',
      pagoMensual: 1100.00,
      calificacion: 45,
      asistencia: 65
    }
  ];
}