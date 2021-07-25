class Api::V1::SpeechesController < ApplicationController
  require './app/tts/main'

  def show
    @param_en = params[:en]
    if Speech.exists?(en: @param_en)
      audio = Speech.where("en = ?", @param_en).find(1)
      render json: { status: 'SUCCESS', data: audio }
    else
      create
    end
  end

  private

  def create
    tts = TTS.new
    audio = tts.convert_to_speech(@param_en)
    speech = Speech.new(en: @param_en, audio: audio)
    if speech.save
      render json: { status: 'SUCCESS', data: audio }
    else
      render json: { status: 'ERROR', data: speech.errors }
    end
  end
end
