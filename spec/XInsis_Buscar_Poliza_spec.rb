require 'spec_helper'


RSpec.describe 'These website' do
  describe 'home page' , js:true do
    before do
      visit 'https://gen.uy.sura.uat.ctplc.ltd:9074/insis_gen_v10/faces/login.jspx'
    end

    it 'Buscar Cotiza'do
      fill_in 'pt1:pt_s2:usrname::content', with: 'insis_rauld' #Ingresa usuario
      fill_in 'pt1:pt_s2:pswd::content', with: 'insis12345' #Ingresa contraseña
      find_by_id('pt1:pt_s2:login').trigger('click') #click en botón Login
      sleep 5
      expect(page.find_by_id('pageTemplate:pt_psl2')).to have_link('Logout') #Busca en link Logout para verificar que inició sesión
      find_by_id('pageTemplate:pt_ps1::i').trigger('click')  #Despliega el menú lateral
      find_by_id('pageTemplate:treeMenu:1:treeMenuLink').click     #Click en GEN
      sleep 5
      find_by_id('pageTemplate:treeMenu:10:treeMenuLink').click     #Click en GEN Pólizas
      sleep 5
      find_by_id('pageTemplate:treeMenu:28:treeMenuLink').click #Click en consulta de póliza
      sleep 5
      expect(page.find_by_id('pageTemplate:pt_ot7j_id_2')).to have_text('Consultas de póliza') # Busca en la navegación en texto "Consultas de póliza" para confirmar que se encuentra en la página buscada
      fill_in 'pageTemplate:mainRegion:1:r_j_id191470:0:r_j_id151842:0:policySearchForm:eueit2::content', with: '100000042781' #Ingresa el número de póliza buscada en el campo de búsqueda
      find_by_id('pageTemplate:mainRegion:1:r_j_id191470:0:r_j_id151842:0:policySearchForm:srchBtn2').trigger('click') #click en botón Search
      sleep 5
      expect(page.find_by_id('pageTemplate:mainRegion:1:r_j_id191470:0:r_j_id151842:0:policySearchForm:policySearchTable:0:eueot2')).to have_text('100000042781') # Busca en la lista de resultados en el primert resultado el numero de póliza búscado
      page.save_and_open_screenshot('buscarCotiza.png', full: true) # Same as save_screenshot.
    end

  end
end
