import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SigninComponent } from './compte-utilisateur/signin/signin.component';
import { SignupComponent } from './compte-utilisateur/signup/signup.component';
import { UserProfileComponent } from './compte-utilisateur/user-profile/user-profile.component';

import { GardienLoginGuard } from './gardien-login.guard';


import { CellierComponent } from './cellier/cellier.component';
import { ListeCellierComponent } from './liste-cellier/liste-cellier.component';
import { AjoutBouteilleComponent } from './ajout-bouteille/ajout-bouteille.component';
import { ModifBouteilleComponent } from './modif-bouteille/modif-bouteille.component';
import { ModifCellierComponent } from './modif-cellier/modif-cellier.component';
import { AjoutCellierComponent } from './ajout-cellier/ajout-cellier.component';
import { ArchiveComponent } from './archive/archive.component';
import { MesBouteillesComponent } from './mes-bouteilles/mes-bouteilles.component';
import { RechercheComponent } from './recherche/recherche.component';

import { ScannerComponent } from './scanner/scanner.component';

import { DetailBouteilleComponent } from './detail-bouteille/detail-bouteille.component';



import {environment} from "../environments/environment";


const routes: Routes = [
//   { path: '', redirectTo: 'accueil', pathMatch: 'full' , title: 'Accueil' },
//   { path: '', component: SigninComponent , title: 'Connection' },
//  { path: '/xyc', component: ListeCellierComponent, canActivate:[GardienLoginGuard] },

  { path: 'inscription', component: SignupComponent , title: 'Inscription' },
  { path: 'profile', component: UserProfileComponent, canActivate:[GardienLoginGuard] , title: 'Profile' },

//   { path: 'accueil', component: AccueilComponent },

  { path: environment.profilPrefix+'liste-cellier', component: ListeCellierComponent, canActivate:[GardienLoginGuard] },
  { path: environment.profilPrefix+'cellier/:id', component: CellierComponent, canActivate:[GardienLoginGuard] },
  { path: environment.profilPrefix+'ajouter-bouteille/:id', component: AjoutBouteilleComponent, canActivate:[GardienLoginGuard] },
  { path: environment.profilPrefix+'modifier-bouteille/:id', component: ModifBouteilleComponent, canActivate:[GardienLoginGuard] },
  { path: environment.profilPrefix+'ajouter-cellier', component: AjoutCellierComponent, canActivate:[GardienLoginGuard] },
  { path: environment.profilPrefix+'modifier-cellier/:id', component: ModifCellierComponent, canActivate:[GardienLoginGuard] },
  { path: environment.profilPrefix+'recherche', component: RechercheComponent, canActivate:[GardienLoginGuard] },

  { path: 'scanner', component: ScannerComponent, canActivate:[GardienLoginGuard] },

  { path: environment.profilPrefix+'archive', component: ArchiveComponent, canActivate:[GardienLoginGuard] },

  { path: 'connexion', component: SigninComponent , title: 'Connection' },


  { path: environment.profilPrefix+'bouteille/:id', component: DetailBouteilleComponent, canActivate:[GardienLoginGuard] },


];

@NgModule({
  imports: [RouterModule.forRoot(routes, { enableTracing: false })],
  exports: [RouterModule],
})

export class AppRoutingModule {}
