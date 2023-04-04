import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { DefaultComponent } from './default.component';
import {DashboardComponent} from "../../modules/dashboard/dashboard.component";
import {RouterModule} from "@angular/router";
//
// On devrait mettre dans declarations les components qui sont utilisés par le default.module.ts
// La raison principale d'utiliser des feature modules est d'organiser la business logic
// relié une feature spécifique. Ces modules consissetent principalement de
// declarations et peu-etre des providers mais ils n'auront jamais d'exports

@NgModule({
  declarations: [
    DefaultComponent,
    DashboardComponent
  ],
  imports: [
    CommonModule,
    RouterModule,
  ]
})
export class DefaultModule { }
