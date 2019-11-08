# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'These website' do
  describe 'home page' , js:true do
    before do
      visit 'https://gen.uy.sura.uat.ctplc.ltd:9074/insis_gen_v10/faces/login.jspx'
    end

    it  { 
      fill_in 'pt1:pt_s2:usrname::content', with: 'insis_vdenis' #Ingresa usuario
      fill_in 'pt1:pt_s2:pswd::content', with: 'These123' #Ingresa contraseña
      find_by_id('pt1:pt_s2:login::icon').trigger('click') #click en botón Login
      sleep 10
      expect(page.find_by_id('pageTemplate:pt_pgl21')).to have_link('Logout') #Busca en link Logout para verificar que inició sesión
      find_by_id('pageTemplate:pt_ps1::i').trigger('click')  #Despliega el menú lateral
      sleep 10
      find_by_id('pageTemplate:treeMenu:1:treeMenuLink').click     #Click en GEN
      sleep 10 
      find_by_id('pageTemplate:treeMenu:14:treeMenuLink').click     #Click en Personas
      sleep 10
      find_by_id('pageTemplate:treeMenu:18:treeMenuLink').click #Click en Clientes
      sleep 10
      find_by_id('pageTemplate:mainRegion:1:r_j_id1201981:0:formTemplate1:qxmctb1').trigger('click') #Click en botón para Crear nuevo cliente
      sleep 10
      
      find_by_id('pageTemplate:mainRegion:1:r_j_id1201981:0:formTemplate1:pdynam1:1:dynam1:0:pt1:allPeopleLink').trigger('click') #Click en lupa para buscar una persona
      sleep 10
      fill_in 'pageTemplate:mainRegion:1:r_j_id1201981:0:formTemplate1:pdynam1:1:dynam1:0:pt1:lovTF:1:pghit1::content', with: '%CI452535%' #Ingresar pid de la persona
      find_by_id('pageTemplate:mainRegion:1:r_j_id1201981:0:formTemplate1:pdynam1:1:dynam1:0:pt1:lovTF:1:srchBtn').click #Click en el boton buscar
      sleep 10
      find_by_id('pageTemplate:mainRegion:1:r_j_id1201981:0:formTemplate1:pdynam1:1:dynam1:0:pt1:lovTF:1:okBtn').click #Click en boton ok
      sleep 10

      select('Activo', :from => 'pageTemplate:mainRegion:1:r_j_id1201981:0:formTemplate1:pdynam1:1:dynam1:0:pt1:soc5::content') #seleccion activo
      select('Tipo 1', :from => 'pageTemplate:mainRegion:1:r_j_id1201981:0:formTemplate1:pdynam1:1:dynam1:0:pt1:soc6::content') #seleccion tipo 1
      select('Asegurado', :from => 'pageTemplate:mainRegion:1:r_j_id1201981:0:formTemplate1:pdynam1:1:dynam1:0:pt1:soc8::content') #seleccion subrol asignar
      
      
      find_by_id('pageTemplate:mainRegion:1:r_j_id1201981:0:formTemplate1:pdynam1:1:dynam1:0:pt1:globalCommit').click #Click salvar
      sleep 10
      
      find_by_id('pageTemplate:mainRegion:1:r_j_id1201981:0:formTemplate1:pdynam1:1:dynam1:0:pt1:globalClose').trigger('click') #Click en cerrar
      sleep 10
      
      
      page.save_and_open_screenshot('screentella3s.png', full: true) # Same as save_screenshot.
    }
    
  end
end
