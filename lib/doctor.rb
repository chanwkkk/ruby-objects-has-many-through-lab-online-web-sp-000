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
    self.appointments.collect(&:patient)
  end

end

p1 = Patient.new
d1 = Doctor.new

Appointment.new("1,1", p1,d1)
