# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'INSIS' , js:true do
  let(:ci) {
    CiUY.random
  }
  let(:nombre){
    Faker::Name.first_name
  }
  let(:apellido){
    Faker::Name.last_name
  }
  let(:empresa){
    Faker::Company.name
  }
  let(:fecha_random){
    Faker::Date.birthday(min_age: 18, max_age: 65)
  }
  let(:fecha_nac){
    DateFormat.change_to(fecha_random, "ONLY_DATE_DEFAULT")
  }
  let(:rut){
    Uy::Rut.new.rut
  }

  before do
    visit 'https://gen.uy.sura.uat.ctplc.ltd:9074/insis_gen_v10/faces/login.jspx'
    fill_in 'pt1:pt_s2:usrname::content', with: 'insis_aferrari' #Ingresa usuario
    fill_in 'pt1:pt_s2:pswd::content', with: 'These1234' #Ingresa contraseña
    find_by_id('pt1:pt_s2:login').trigger('click') #click en botón Login
  end
  after do
    find_by_id('pageTemplate:pt_psl3').trigger('click')     #Click en GEN
    puts ci
    puts nombre
    puts apellido
    puts empresa
    puts fecha_nac
    puts rut
  end
  context 'Persona' do
    it  'física' do
      sleep 3
      find_by_id('pageTemplate:pt_ps1::i').trigger('click')  #Despliega el menú lateral
      sleep 3 
      find_by_id('pageTemplate:treeMenu:1:treeMenuLink').trigger('click')     #Click en GEN
      sleep 3 
      find_by_id('pageTemplate:treeMenu:14:treeMenuLink').trigger('click')     #Click en Personas
      sleep 3
      find_by_id('pageTemplate:treeMenu:28:treeMenuLink').trigger('click') #Click en personas
      sleep 3
      find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:qxmctb1').click #Click en botón para crear nueva persona
      sleep 6
      select('Física', :from => 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:manComp::content') #selecciono tipo de persona Física
      fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:it22::content', with: nombre #Ingreso el nombre
      fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:it27::content', with: apellido #Ingreso el apellido
      fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:s1r1:0:it4::content', with: ci #Ingreso CI
      fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:id2::content', with: fecha_nac #Ingreso Fecha de nacimiento
      select('Hombre', :from => 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:soc2::content') #Selecciono sexo
      select('Cédula de Identidad', :from => 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:s1r1:0:soc6::content') #selecciono tipo de documento
      sleep 3
      find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:globalCommit::icon').trigger('click') #Click en save
      find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:globalClose').trigger('click') #Click en close
      
      
    end


      it 'jurídica' do
        sleep 4
        find_by_id('pageTemplate:pt_ps1::i').trigger('click')  #Despliega el menú lateral
        sleep 4
        find_by_id('pageTemplate:treeMenu:1:treeMenuLink').trigger('click')     #Click en GEN
        sleep 4 
        find_by_id('pageTemplate:treeMenu:14:treeMenuLink').trigger('click')     #Click en Personas
        sleep 4
        find_by_id('pageTemplate:treeMenu:28:treeMenuLink').trigger('click') #Click en personas
        sleep 4
        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:qxmctb1').trigger('click') #Click en botón para crear nueva persona
        sleep 8
        select('Jurídica', :from => 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:manComp::content') #selecciono tipo de persona Jurídica
        sleep 4
        fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:it18::content', with: empresa #Ingreso razón social
        fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:s1r1:0:it4::content', with: rut #Ingreso razón social
        select('R.U.T', :from => 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:s1r1:0:soc6::content') #selecciono tipo de documento        
        page.save_and_open_screenshot('screen1.png', full: true) # Same as save_screenshot.

        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:globalCommit::icon').trigger('click') #Click en save
        page.save_and_open_screenshot('screen2.png', full: true) # Same as save_screenshot.

        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:globalClose').trigger('click') #Click en close
        page.save_and_open_screenshot('screen3.png', full: true) # Same as save_screenshot.
      end
    end
end
