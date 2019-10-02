class TerminologiesController < ApplicationController
  def index
    terminologies = Terminology.order('created_at DESC');
    render json: { translations: terminologies }
  end

  def create
    terminology = Terminology.new(terminology_params)
    terminology["pig_latin"] = terminology.translate(terminology["english"])

    if terminology.save
      render json: {
        status: :successful,
        result: :stored,
        terminology: terminology
      }
    elsif !Terminology.where(:pig_latin => terminology.pig_latin).blank?
      render json: {
        status: :successful,
        result: :already_stored,
        terminology: terminology
      }
    else
      render json: {
        status: :error,
        result: :not_stored,
        terminology: nil
      }
    end
  end

  def destroy
    terminology = Terminology.find(params[:id])
    terminology.destroy
    render json: {
      status: :successful,
      result: :deleted,
      terminology: terminology
    }
  end

  def update
    terminology = Terminology.find(params[:id])
    terminology.update(terminology_params)
    terminology["pig_latin"] = terminology.translate(terminology["english"])
    if terminology.update(terminology_params)
      render json: {
        status: :successful,
        result: :updated,
        terminology: terminology
      }
    else
      original = Terminology.find(params[:id])
      render json: {
        status: :unsuccessful,
        result: :no_change,
        reason: :already_stored,
        terminology: original
      }
    end
  end

  private

  def terminology_params
    params.permit(:english, :pig_latin)
  end
end
