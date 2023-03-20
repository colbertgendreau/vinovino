import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { SigninComponent } from './compte-utilisateur/signin/signin.component';
import { SignupComponent } from './compte-utilisateur/signup/signup.component';
import { UserProfileComponent } from './compte-utilisateur/user-profile/user-profile.component';

import { GardienLoginGuard } from './gardien-login.guard';

import { EnteteComponent } from './entete/entete.component';
import { AccueilComponent } from './accueil/accueil.component';
import { CellierComponent } from './cellier/cellier.component';
import { ListeCellierComponent } from './liste-cellier/liste-cellier.component';
import { AjoutBouteilleComponent } from './ajout-bouteille/ajout-bouteille.component';
import { ModifBouteilleComponent } from './modif-bouteille/modif-bouteille.component';
import { ModifCellierComponent } from './modif-cellier/modif-cellier.component';
import { AjoutCellierComponent } from './ajout-cellier/ajout-cellier.component';
import { MesBouteillesComponent } from './mes-bouteilles/mes-bouteilles.component';


const routes: Routes = [
//   { path: '', redirectTo: 'accueil', pathMatch: 'full' , title: 'Accueil' },
  { path: '', component: SigninComponent , title: 'Connection' },
  { path: 'connexion', component: SigninComponent , title: 'Connection' },
  { path: 'inscription', component: SignupComponent , title: 'Inscription' },
  { path: 'profile', component: UserProfileComponent, canActivate:[GardienLoginGuard] , title: 'Profile' },

//   { path: 'accueil', component: AccueilComponent },
  { path: 'liste-cellier', component: ListeCellierComponent, canActivate:[GardienLoginGuard] },
  { path: 'cellier/:id', component: CellierComponent, canActivate:[GardienLoginGuard] },
  { path: 'ajouter-bouteille/:id', component: AjoutBouteilleComponent, canActivate:[GardienLoginGuard] },
  { path: 'modifier-bouteille/:id', component: ModifBouteilleComponent, canActivate:[GardienLoginGuard] },
  { path: 'ajouter-cellier', component: AjoutCellierComponent, canActivate:[GardienLoginGuard] },
  { path: 'modifier-cellier/:id', component: ModifCellierComponent, canActivate:[GardienLoginGuard] },
  { path: 'recherche', component: MesBouteillesComponent, canActivate:[GardienLoginGuard] },


];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})

export class AppRoutingModule {}
