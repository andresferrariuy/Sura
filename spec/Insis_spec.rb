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
        sleep 4
        find_by_id('pageTemplate:pt_ps1::i').trigger('click')  #Despliega el menú lateral
        sleep 4 
        find_by_id('pageTemplate:treeMenu:1:treeMenuLink').trigger('click')     #Click en GEN
        sleep 4 
        find_by_id('pageTemplate:treeMenu:14:treeMenuLink').trigger('click')     #Click en Personas
        sleep 4
        find_by_id('pageTemplate:treeMenu:28:treeMenuLink').trigger('click') #Click en personas
        sleep 4
        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:qxmctb1').click #Click en botón para crear nueva persona
        sleep 8
        select('Física', :from => 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:manComp::content') #selecciono tipo de persona Física
        fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:it22::content', with: nombre #Ingreso el nombre
        fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:it27::content', with: apellido #Ingreso el apellido
        fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:s1r1:0:it4::content', with: ci #Ingreso CI
        fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:id2::content', with: fecha_nac #Ingreso Fecha de nacimiento
        select('Hombre', :from => 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:soc2::content') #Selecciono sexo
        select('Cédula de Identidad', :from => 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:s1r1:0:soc6::content') #selecciono tipo de documento
        sleep 3
        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:globalCommit::icon').trigger('click') #Click en save
        sleep 4
        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:r1:0:sdi31::disAcr').trigger('click') #Click en Direcciones
        sleep 3
        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:r1:0:r5:0:pspctb1').trigger('click') #Click Crear nueva dirección
        sleep 5
        select('Fiscal', :from => 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:r1:0:r5:1:soc1::content') #selecciono tipo de dirección
        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:r1:0:r5:1:postCodeImgLink').trigger('click') #Lupa dir postal
        sleep 3
        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:r1:0:r5:1:lovRegion:1:searchBtn').trigger('click') #Buscar dirección postal
        find(:xpath, '//*[@id="pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:r1:0:r5:1:lovRegion:1:resultTableId::db"]/table/tbody/tr[2]').click()
        sleep 3
        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:r1:0:r5:1:lovRegion:1:resultTableId:1:tkaot3').trigger('click') #seleccionar código postal
        sleep 3
        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:r1:0:r5:1:lovRegion:1:okBtn').trigger('click') #Confirmar código postal
        sleep 3
        page.save_and_open_screenshot('screen1.png', full: true) # Same as save_screenshot.
        sleep 3
        fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:r1:0:r5:1:it21::content', with: '1234' #Ingresar número de calle
        sleep 3
        fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:r1:0:r5:1:it14::content', with: '1' #Ingresar Manzana
        sleep 3
        fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:r1:0:r5:1:it2::content', with: '1' #Ingresar Bloque
        sleep 3
        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:r1:0:r5:1:applyAddr').trigger('click') #Concatenar dir

        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:r1:0:r5:1:submitBtn').trigger('click') #Salvar dirección
        sleep 3
        page.save_and_open_screenshot('screen2.png', full: true) # Same as save_screenshot.
        sleep 3
        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:globalCommit::icon').trigger('click') #Click en save
        sleep 3
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
        fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:s1r1:0:it4::content', with: rut #Ingreso rut
        select('R.U.T', :from => 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:s1r1:0:soc6::content') #selecciono tipo de documento        

        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:globalCommit::icon').trigger('click') #Click en save

        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:globalClose').trigger('click') #Click en close
      end
    end
end
