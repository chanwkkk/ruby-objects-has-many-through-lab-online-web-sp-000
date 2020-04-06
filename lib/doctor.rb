require 'pry'
class Doctor
  attr_accessor :name
  @@all=[]

  def self.all
     @@all
  end


  def initialize(name)
     @name=name
     @@all<<self
  end

  def new_appointment(patient,date)
     Appointment.new(date,patient,self)
  end

  def appointments
     Appointment.all.select{|appointment| appointment.doctor==self}
  end

  def patients
    self.appointments.collect(&:patient) do
      binding.pry
    end
  end

end

Doctor.new.patients