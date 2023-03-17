import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AjoutAdminComponent } from './ajout-admin/ajout-admin.component';
import { ConnexionAdminComponent } from './connexion-admin/connexion-admin.component';
import { ListeCatalogueComponent } from './liste-catalogue/liste-catalogue.component';
import { ListeUsagerComponent } from './liste-usager/liste-usager.component';

const routes: Routes = [
  { path : "admin", component : ConnexionAdminComponent },
  { path : "liste-usager", component : ListeUsagerComponent },
  { path : "catalogue", component : ListeCatalogueComponent },
  { path : "ajout-admin", component : AjoutAdminComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
