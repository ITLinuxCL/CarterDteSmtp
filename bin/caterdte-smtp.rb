#!/usr/bin/env ruby

require 'bundler/setup'
require 'carter_dte_smtp'

CarterDteSmtp::CLI.start(ARGV)