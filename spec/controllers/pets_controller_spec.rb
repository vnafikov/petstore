RSpec.describe PetsController, type: :controller do
  describe '#index' do
    let(:id) { 1 }
    let(:response_status) { 200 }
    let(:body) { [{id: id, status: 'available'}, {id: id + 1, status: 'pending'}].to_json }
    let(:query) { 'status=available&status=pending&status=sold' }
    let(:pets) { controller.instance_variable_get(:@pets) }

    before do
      stub_request(:get, "http://petstore.swagger.io/v2/pet/findByStatus?#{query}").with(
        headers: {
          'Accept' => 'application/json',
          'X-Api-Key' => 'secret-key'
        }
      ).to_return(status: response_status, body: body)
    end

    context 'when without filter' do
      before { get :index }

      it { expect(response).to have_http_status :ok }
      it { expect(pets.size).to eq 2 }
      it { expect(pets.first.id).to eq id }
      it { expect(pets.first.status).to eq 'available' }
      it { expect(pets.last.id).to eq id + 1 }
      it { expect(pets.last.status).to eq 'pending' }
    end

    context 'when pass filter values' do
      let(:statuses) { %w[available pending] }
      let(:body) { [{id: id, status: statuses.first}, {id: id + 1, status: statuses.last}].to_json }
      let(:query) { statuses.map { |status| "status=#{status}" }.join('&') }

      before { get :index, params: {status: statuses} }

      it { expect(response).to have_http_status :ok }
      it { expect(pets.size).to eq 2 }
      it { expect(pets.first.id).to eq id }
      it { expect(pets.first.status).to eq statuses.first }
      it { expect(pets.last.id).to eq id + 1 }
      it { expect(pets.last.status).to eq statuses.last }
    end
  end
end
