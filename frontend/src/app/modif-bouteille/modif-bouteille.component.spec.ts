import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModifBouteilleComponent } from './modif-bouteille.component';

describe('ModifBouteilleComponent', () => {
  let component: ModifBouteilleComponent;
  let fixture: ComponentFixture<ModifBouteilleComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ModifBouteilleComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ModifBouteilleComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
