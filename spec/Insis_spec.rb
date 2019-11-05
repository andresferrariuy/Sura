# frozen_string_literal: true

require 'spec_helper'

RSpec.describe 'These website' do
  describe 'home page' , js:true do
    before do
      visit 'https://gen.uy.sura.uat.ctplc.ltd:9074/insis_gen_v10/faces/login.jspx'
    end

    it  { 
      fill_in 'pt1:pt_s2:usrname::content', with: 'insis_aferrari' #Ingresa usuario
      fill_in 'pt1:pt_s2:pswd::content', with: 'These1234' #Ingresa contraseña
      find_by_id('pt1:pt_s2:login').trigger('click') #click en botón Login
      sleep 5
      expect(page.find_by_id('pageTemplate:pt_psl3')).to have_link('Logout') #Busca en link Logout para verificar que inició sesión
      find_by_id('pageTemplate:pt_ps1::i').trigger('click')  #Despliega el menú lateral
      find_by_id('pageTemplate:treeMenu:1:treeMenuLink').click     #Click en GEN
      sleep 5 
      find_by_id('pageTemplate:treeMenu:14:treeMenuLink').click     #Click en Personas
      sleep 5
      find_by_id('pageTemplate:treeMenu:28:treeMenuLink').click #Click en personas
      sleep 5
      find_by_id('pageTemplate:mainRegion:1:r_j_id301082:0:formTemplate1:qxmctb1').click #Click en botón para crear nueva persona
    
    
    
    
    
    }
    
  end
end
