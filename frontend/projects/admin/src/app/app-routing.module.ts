import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ListeCatalogueComponent } from './liste-catalogue/liste-catalogue.component';
import { ListeUsagerComponent } from './liste-usager/liste-usager.component';

const routes: Routes = [
  { path : "", component : ListeUsagerComponent },
  { path : "catalogue", component : ListeCatalogueComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
