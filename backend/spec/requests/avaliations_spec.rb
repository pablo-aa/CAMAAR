require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/avaliations", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Avaliation. As you add validations to Avaliation, be sure to
  # adjust the attributes here as well.
  let(:subject){Subject.create(
    code: "332788913/2",
    name: "Matéria de Teste"
  )}
  let(:cclass){Cclass.create(
    code: "12334",
    semester:"2020/1",
    time:"2020",
    subject_id: subject.id
  )}
  let(:valid_attributes) {
    {
      title: 'Prova1',
      cclass_id: cclass.id
    }
  }

  let(:invalid_attributes) {
    {
      title: 'Prova2',
      cclass_id: nil
    }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # AvaliationsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Avaliation.create! valid_attributes
      get avaliations_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      avaliation = Avaliation.create! valid_attributes
      get avaliation_url(avaliation), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Avaliation" do
        expect {
          post avaliations_url,
               params: { avaliation: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Avaliation, :count).by(1)
      end

      it "renders a JSON response with the new avaliation" do
        post avaliations_url,
             params: { avaliation: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Avaliation" do
        expect {
          post avaliations_url,
               params: { avaliation: invalid_attributes }, as: :json
        }.to change(Avaliation, :count).by(0)
      end

      it "renders a JSON response with errors for the new avaliation" do
        post avaliations_url,
             params: { avaliation: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested avaliation" do
        avaliation = Avaliation.create! valid_attributes
        patch avaliation_url(avaliation),
              params: { avaliation: new_attributes }, headers: valid_headers, as: :json
        avaliation.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the avaliation" do
        avaliation = Avaliation.create! valid_attributes
        patch avaliation_url(avaliation),
              params: { avaliation: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the avaliation" do
        avaliation = Avaliation.create! valid_attributes
        patch avaliation_url(avaliation),
              params: { avaliation: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested avaliation" do
      avaliation = Avaliation.create! valid_attributes
      expect {
        delete avaliation_url(avaliation), headers: valid_headers, as: :json
      }.to change(Avaliation, :count).by(-1)
    end
  end
end
