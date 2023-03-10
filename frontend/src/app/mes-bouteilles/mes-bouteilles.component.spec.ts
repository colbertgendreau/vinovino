import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MesBouteillesComponent } from './mes-bouteilles.component';

describe('MesBouteillesComponent', () => {
  let component: MesBouteillesComponent;
  let fixture: ComponentFixture<MesBouteillesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MesBouteillesComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MesBouteillesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
