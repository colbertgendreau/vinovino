import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { SigninComponent } from './components/signin/signin.component';
import { SignupComponent } from './components/signup/signup.component';
import { UserProfileComponent } from './components/user-profile/user-profile.component';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { ReactiveFormsModule, FormsModule } from '@angular/forms';
import { AuthInterceptor } from './shared/auth.interceptor';
import { EnteteComponent } from './entete/entete.component';
import { AccueilComponent } from './accueil/accueil.component';
import { CellierComponent } from './cellier/cellier.component';
import { ListeCellierComponent } from './liste-cellier/liste-cellier.component';
import { AjoutBouteilleComponent } from './ajout-bouteille/ajout-bouteille.component';
import { ModifBouteilleComponent } from './modif-bouteille/modif-bouteille.component';
import { ModifCellierComponent } from './modif-cellier/modif-cellier.component';
import { AjoutCellierComponent } from './ajout-cellier/ajout-cellier.component';


const routes: Routes = [
  { path: '', redirectTo: '/login', pathMatch: 'full' },
  { path: 'login', component: SigninComponent },
  { path: 'register', component: SignupComponent },
  { path: 'profile', component: UserProfileComponent },
  // { path: 'dashboard', component: BouteilleComponent },
];


@NgModule({
  declarations: [
    AppComponent,
    SigninComponent,
    SignupComponent,
    UserProfileComponent,
    EnteteComponent,
    AccueilComponent,
    CellierComponent,
    ListeCellierComponent,
    AjoutBouteilleComponent,
    ModifBouteilleComponent,
    ModifCellierComponent,
    AjoutCellierComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    ReactiveFormsModule,
    FormsModule,
  ],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: AuthInterceptor,
      multi: true,
    },
  ],
  bootstrap: [AppComponent],
})
export class AppModule {}
