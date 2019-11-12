require 'spec_helper'


RSpec.describe 'These website' do
  describe 'home page' , js:true do
    before do
      visit 'https://gen.uy.sura.uat.ctplc.ltd:9074/insis_gen_v10/faces/login.jspx'


    end
      pidCLient = 'CI343333'
      it 'Nueva Cotiza' do
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
        find_by_id('pageTemplate:treeMenu:21:treeMenuLink').click #Click en cotización
        sleep 5
    #    page.save_and_open_screenshot('página cotización.png', full: true) # Same as save_screenshot.
        expect(page.find_by_id('pageTemplate:pt_ot7j_id_2')).to have_text('Cotización') # Busca en la navegación en texto "Consultas de póliza" para confirmar que se encuentra en la página buscada

        fill_in 'pageTemplate:mainRegion:1:r_j_id10061136:0:r_j_id5121402:0:formTemplate1:qxmit1::content', with: pidCLient #Ingresa Pid del cliente
    #    page.save_and_open_screenshot('PID.png', full: true) # Same as save_screenshot.

        find_by_id('pageTemplate:mainRegion:1:r_j_id10061136:0:r_j_id5121402:0:formTemplate1:qxmit1::content').native.send_keys(:return) # Presionar la tecla enter para iniciar la búsqueda
        find_by_id('pageTemplate:mainRegion:1:trainBtnBar_j_id7651699:1:cni1_j_id7651699').click    #Click en siguiente1
        sleep 5
    #    page.save_and_open_screenshot('primerPantallaCotiza.png', full: true) # Same as save_screenshot.

        #find('pageTemplate:mainRegion:1:trainBtnBar_j_id8091742:1:cni1_j_id8091742').click
        find('button[accesskey="S"]').click  #Click en siguiente2
        sleep 5
    #    page.save_and_open_screenshot('segundaPantallaCotiza.png', full: true) # Same as save_screenshot.

        find('button[accesskey="S"]').click  #Click en siguiente3
        sleep 5
    #    page.save_and_open_screenshot('terceraPantallaCotiza.png', full: true) # Same as save_screenshot..

        find('button[accesskey="S"]').click  #Click en siguiente3
        sleep 5
    #    page.save_and_open_screenshot('cuartaPantallaCotiza.png', full: true) # Same as save_screenshot.

        find('a[accesskey="A"]').click #Click en crear agente
        sleep 5
        page.save_and_open_screenshot('agregar agente.png', full: true) # Same as save_screenshot.

        if ! expect(page.find_by_id('pageTemplate:mainRegion:1:r_j_id23171654:0:r_j_id3971720:0:pt1:tabl:0:it2::content')).to have_text('6010001283') # Busca en el grid de agentes si existe agente selccionado
          # Seleccionar agente

          find_by_id('pageTemplate:mainRegion:1:r_j_id23171654:0:r_j_id3971720:0:pt1:tabl:0:clientLOVLink').trigger('click') #Click en crear agente
          sleep 5
          page.save_and_open_screenshot('pantallaAgente.png', full: true) # Same as save_screenshot.

          fill_in 'pageTemplate:mainRegion:1:r_j_id23171654:0:r_j_id3971720:0:pt1:rgTem2:1:zdbit2::content', with: '%victoria%' #Ingresa texto de búsqueda de agente
          find_by_id('pageTemplate:mainRegion:1:r_j_id23171654:0:r_j_id3971720:0:pt1:rgTem2:1:zdbit2::content').native.send_keys(:return) # Presionar la tecla enter para iniciar la búsqueda
          sleep 5
          page.save_and_open_screenshot('listadoDeAgentes.png', full: true) # Same as save_screenshot.

          find_by_id('pageTemplate:mainRegion:1:r_j_id23171654:0:r_j_id3971720:0:pt1:rgTem2:1:resultTableId:0:zdbot1').click #Click en grid para seleccionar agente encontrado
          find('div[id="pageTemplate:mainRegion:1:r_j_id23171654:0:r_j_id3971720:0:pt1:rgTem2:1:okBtn"]').click #Click en crear ok para cargar el agente encontrado
          sleep 5

          select('Sales agent, the agent that originally sold the policy', :from => 'pageTemplate:mainRegion:1:r_j_id23171654:0:r_j_id3971720:0:pt1:tabl:0:soc1::content') #seleccion la función del agente
          fill_in 'pageTemplate:mainRegion:1:r_j_id23171654:0:r_j_id3971720:0:pt1:tabl:0:it6::content', with: '100' #Ingresa participación del agente
          find('div[id="pageTemplate:mainRegion:1:commitBtn_j_id4971179"]').click #Click en botón guardar datos
          sleep 5

        end
        page.save_and_open_screenshot('agenteCargado.png', full: true) # Same as save_screenshot.

        find('a[id="pageTemplate:mainRegion:1:r_j_id23171654:0:spltr_j_id17811422::i"]').trigger('click') #Click en abrir panel

        #crear nueva cotización
        find('div[id="pageTemplate:mainRegion:1:r_j_id23171654:0:r_j_id17941675:0:pt1:crEngQuoteBtn"]').trigger('click') #Click en crear en botón crear nueva cotiza
        sleep 5
        page.save_and_open_screenshot('crearNuevaCotiza.png', full: true) # Same as save_screenshot.

        # Seleccionar producto y crear cotización
        fill_in 'pageTemplate:mainRegion:1:r_j_id23171654:0:r_j_id17941675:0:pt1:rgTem2:1:mvfit1::content', with: '4104' #Ingresa texto de búsqueda de producto
        find_by_id('pageTemplate:mainRegion:1:r_j_id23171654:0:r_j_id17941675:0:pt1:rgTem2:1:mvfit1::content').native.send_keys(:return) # Presionar la tecla enter para iniciar la búsqueda
        sleep 5
        page.save_and_open_screenshot('productoEncontrado.png', full: true) # Same as save_screenshot.

        find('table[_selstate="{}"]').click #Click en crear ok para cargar el agente encontrado
        find('div[id="pageTemplate:mainRegion:1:r_j_id23171654:0:r_j_id17941675:0:pt1:rgTem2:1:okBtn"]').click #Click en crear ok para cargar el agente encontrado
        sleep 5
        page.save_and_open_screenshot('cotizacionCreada.png', full: true) # Same as save_screenshot.

        find('button[accesskey="S"]').click  #Click en siguiente a pantalla cotización general
        sleep 5
        page.save_and_open_screenshot('pantallaCotizacionGeneral.png', full: true) # Same as save_screenshot.

        find('button[accesskey="S"]').click  #Click en siguiente a pantalla de pantallaCoberturas
        sleep 5
        page.save_and_open_screenshot('pantallaCoberturas.png', full: true) # Same as save_screenshot.

        # abrir pantalla de selección de objetos de cobertura

        find_by_id('pageTemplate:mainRegion:1:r_j_id19741547:0:r_j_id561262:0:form:add').click #Click en botón agregar objeto Cobertura

        sleep 5
        page.save_and_open_screenshot('pantallaSelecionarObjetoCobertura.png', full: true) # Same as save_screenshot.

        # Buscar y seleccionar objeto de cobertura

        find('a[id="pageTemplate:mainRegion:1:r_j_id19741547:0:r_j_id561262:0:form:dynam1:1:templId:details"]').trigger('click') #clik en el botón detalles del objeto de cobertura
        sleep 5
        page.save_and_open_screenshot('clickBotonDetallesObjetoCobertura.png', full: true) # Same as save_screenshot.

        fill_in 'pageTemplate:mainRegion:1:r_j_id19741547:0:r_j_id561262:0:form:dynam1:1:templId:dynObjTF:1:dynam1:0:formTemplate1:qxmit1::content', with: pidCLient #Ingresa el PID del cliente a buscar
        find_by_id('pageTemplate:mainRegion:1:r_j_id19741547:0:r_j_id561262:0:form:dynam1:1:templId:dynObjTF:1:dynam1:0:formTemplate1:qxmit1::content').native.send_keys(:return) # Presionar la tecla enter para iniciar la búsqueda
        sleep 5
        page.save_and_open_screenshot('clienteEncontrada.png', full: true) # Same as save_screenshot.


        find('span[id="pageTemplate:mainRegion:1:r_j_id19741547:0:r_j_id561262:0:form:dynam1:1:templId:dynObjTF:1:dynam1:0:formTemplate1:peopleTable:0:qxmot2"]').click #Click en grid para seleccionar el cliente encontrado
        find_by_id('pageTemplate:mainRegion:1:r_j_id19741547:0:r_j_id561262:0:form:dynam1:1:templId:dynObjTF:1:dynam1:0:formTemplate1:okBtn').click #Click botón ok para cargar los detalles del cliente
        sleep 5

        page.save_and_open_screenshot('clienteSeleccionado.png', full: true) # Same as save_screenshot.

        find('div[id="pageTemplate:mainRegion:1:r_j_id19741547:0:r_j_id561262:0:form:dynam1:1:templId:globalCommit"]').trigger('click') #clik en el botón save objet
        sleep 5
        page.save_and_open_screenshot('clienteGuardado.png', full: true) # Same as save_screenshot.

        find('div[id="pageTemplate:mainRegion:1:r_j_id19741547:0:r_j_id561262:0:form:dynam1:1:templId:globalClose"]').trigger('click') #clik en el botón close, cerrar el popu y cargar el objeto de cobertura en la cotiza
        sleep 5
        page.save_and_open_screenshot('clienteCargadoEnCotizax.png', full: true) # Same as save_screenshot.

      end
  end
end
