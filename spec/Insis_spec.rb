# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'INSIS' , js:true do
    let(:ci) {
    CiUY.random
    }
    before do
      visit 'https://gen.uy.sura.uat.ctplc.ltd:9074/insis_gen_v10/faces/login.jspx'
    end
    after do
      find_by_id('pageTemplate:pt_psl3').click     #Click en GEN
    end
    context 'Persona' do
      it  'física' do
        fill_in 'pt1:pt_s2:usrname::content', with: 'insis_aferrari' #Ingresa usuario
        fill_in 'pt1:pt_s2:pswd::content', with: 'These1234' #Ingresa contraseña
        find_by_id('pt1:pt_s2:login').trigger('click') #click en botón Login
        sleep 5
        expect(page.find_by_id('pageTemplate:pt_psl3')).to have_link('Logout') #Busca el link Logout para verificar que inició sesión
        find_by_id('pageTemplate:pt_ps1::i').trigger('click')  #Despliega el menú lateral
        find_by_id('pageTemplate:treeMenu:1:treeMenuLink').click     #Click en GEN
        sleep 5 
        find_by_id('pageTemplate:treeMenu:14:treeMenuLink').click     #Click en Personas
        sleep 5
        find_by_id('pageTemplate:treeMenu:28:treeMenuLink').click #Click en personas
        sleep 5
        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:qxmctb1').click #Click en botón para crear nueva persona
        sleep 10
        select('Física', :from => 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:manComp::content') #selecciono tipo de persona Física
        fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:it22::content', with: 'Prueba' #Ingreso el nombre
        fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:it27::content', with: 'Automatizada' #Ingreso el apellido
        fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:s1r1:0:it4::content', with: ci #Ingreso CI
        fill_in 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:id2::content', with: '11/11/1991' #Ingreso Fecha de nacimiento
        select('Cédula de Identidad', :from => 'pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:s1r1:0:soc6::content') #selecciono tipo de documento
        sleep 5
        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:globalCommit::icon').trigger('click') #Click en save
        find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:pdynam1:1:dynam1:0:pt1:globalClose').trigger('click') #Click en close
        
        
      end


        it 'jurídica' do
          fill_in 'pt1:pt_s2:usrname::content', with: 'insis_aferrari' #Ingresa usuario
          fill_in 'pt1:pt_s2:pswd::content', with: 'These1234' #Ingresa contraseña
          find_by_id('pt1:pt_s2:login').trigger('click') #click en botón Login
          sleep 5
          expect(page.find_by_id('pageTemplate:pt_psl3')).to have_link('Logout') #Busca el link Logout para verificar que inició sesión

        end
      end
end
