# frozen_string_literal: true
require 'slim/h_tag/filter'
require 'slim/h_tag/version'

Slim::Engine.after Slim::Interpolation, Slim::HTag::Filter
