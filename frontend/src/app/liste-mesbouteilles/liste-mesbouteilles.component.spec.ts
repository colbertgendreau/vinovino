import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListeMesbouteillesComponent } from './liste-mesbouteilles.component';

describe('ListeMesbouteillesComponent', () => {
  let component: ListeMesbouteillesComponent;
  let fixture: ComponentFixture<ListeMesbouteillesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ListeMesbouteillesComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ListeMesbouteillesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
