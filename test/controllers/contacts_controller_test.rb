require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contacts_url
    assert_response :success
    assert_select "h2", text: /Fale Conosco/
  end

  test "should create contact" do
    assert_difference("Contact.count") do
      post contacts_url, params: {
        contact: {
          name: "Produtor Associado Carlos",
          phone: "(62) 99999-1111",
          email: "carlos@fazenda.com.br",
          message: "Desejo cadastrar novo lote de grãos na cooperativa."
        }
      }
    end

    assert_redirected_to contact_sent_url
    follow_redirect!
    assert_select "h2", text: /Mensagem Recebida/
  end
end
