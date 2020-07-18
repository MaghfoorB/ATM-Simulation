CREATE TABLE UserBio
(
UserID INT NOT NULL,
NIC VARCHAR(15) NOT NULL,
Name VARCHAR(30) NOT NULL,
Email VARCHAR(20) NOT NULL,
Phone VARCHAR(13)

PRIMARY KEY (UserID)
);

CREATE TABLE Accounts
(
AccID INT NOT NULL,
OwnerID INT NOT NULL,
Balance INT NOT NULL,
PIN INT NOT NULL,
atm_access INT

PRIMARY KEY (AccID),
FOREIGN KEY (OwnerID) REFERENCES UserBio(UserID)
);

DROP TABLE Accounts;

CREATE TABLE Transfers
(
TID INT IDENTITY(1, 1) NOT NULL,
SenderAccID INT NOT NULL,
RecieverAccID INT NOT NULL,
Amount INT NOT NULL,
DateOf DATATIME,

PRIMARY KEY (TID),
FOREIGN KEY (SenderAccID) REFERENCES Accounts(AccID),
FOREIGN KEY (RecieverAccID) REFERENCES Accounts(AccID)
);

CREATE TABLE Withdrawals
(
WID INT IDENTITY(1, 1) NOT NULL,
AccID INT NOT NULL,
Amount INT NOT NULL,
DateOf DATATIME

PRIMARY KEY (WID),
FOREIGN KEY (AccID) REFERENCES Accounts(AccID)
);

CREATE TABLE Dispenser
(
Amount INT NOT NULL
PRIMARY KEY (Amount)
);

SELECT * FROM Accounts
alter TABLE Accounts
add Atm_access INT default 0;

alter TABLE Accounts
alter column Atm_access 
SET DEFAULT 0;


INSERT INTO UserBio VALUES (1, '33201-442156-64', 'Maghfoor', 'sk@gmail.com', '0333444024');
INSERT INTO UserBio VALUES (2, '33201-442156-18', 'Siddique', 'hj@gmail.com', '0333444024');
INSERT INTO UserBio VALUES (3, '33201-412556-14', 'Ibrahim', 'ib@gmail.com', '0333444024');
INSERT INTO UserBio VALUES (4, '33201-442156-14', 'Hasnain', 'hr@gmail.com', '0333444024');
INSERT INTO UserBio VALUES (5, '33201-452151-17', 'Rooney', 'r1@gmail.com', '0333444024');
INSERT INTO UserBio VALUES (6, '44320-345341-17', 'Trump', 't3@yahoo.com', '03452242313');

INSERT INTO Accounts VALUES (1, 2, 50000, 5639, 0);
INSERT INTO Accounts VALUES (2, 1, 0, 5688, 1);
INSERT INTO Accounts VALUES (3, 3, 80000, 9679, 0);
INSERT INTO Accounts VALUES (4, 5, 11000, 1689, 0);
INSERT INTO Accounts VALUES (5, 4, 900000, 1689, 0);
INSERT INTO Accounts VALUES (10, 6, 100, 5555, 0);		--account id 10 = admin

INSERT INTO Transfers VALUES (2, 3, 100, '6/7/2017');
INSERT INTO Transfers VALUES (2, 4, 700, '9/9/2017');
INSERT INTO Transfers VALUES (1, 2, 1900, '1/1/2017');
INSERT INTO Transfers VALUES (3, 5, 40, '1/8/2017');
INSERT INTO Transfers VALUES (5, 1, 600, '6/3/2017');

INSERT INTO Dispenser VALUES (50000);

INSERT INTO Withdrawals VALUES (1, 5000, '4/4/2014');	--WID not provided, auto increments
INSERT INTO Withdrawals VALUES (1, 4000, '4/4/2022');
INSERT INTO Withdrawals VALUES (2, 4000, '4/4/2014');
INSERT INTO Withdrawals VALUES (3, 14000, '4/4/2017');


--Stored PROCEDUREs
--PIN Number and Account Number authentication

CREATE PROCEDURE authenticate
@accno INT,
@pin INT,
@error INT = 0 output
as
BEGIN
SELECT *			--see if given account number exists
FROM Accounts
WHERE AccID = @accno
if @@ROWCOUNT = 0
BEGIN
set @error = 1			--account not found, RETURN 1
RETURN
end

DECLARE @flag INT;
SELECT @flag = atm_access
FROM Accounts
WHERE AccID = @accno
if @flag = 1
BEGIN
set @error = 2			--access blocked
RETURN
end

DECLARE @realPin INT;	--see if pin is correct
SELECT @realPin = PIN
FROM Accounts
WHERE AccID = @accno
if @realPin != @pin
BEGIN
set @error = 3			--incorrect pin
RETURN
end
--no error
end		--end of PROCEDURE

--check withdrawal amount (in account and in dispenser)
CREATE PROCEDURE check_Amount
@amount INT,
@accno INT,
@error INT = 0 output
as
BEGIN
DECLARE @balance INT;
SELECT @balance = Balance		--get current balance
FROM Accounts
WHERE AccID = @accno

if @amount > @balance
BEGIN
set @error = 1				--not enough balance
RETURN
end

SELECT @balance = Amount			
FROM Dispenser				--Dispenser is a single entry TABLE containing the current amount held in the machine

if @amount > @balance
BEGIN
set @error = 2				--not enough cash in dispenser
RETURN
end
--no error

INSERT INTO Withdrawals VALUES (@accno, @amount, GETDATE())		--INSERT INTO Withdrawals

update Accounts							--update balance of user
set Balance = Balance - @amount
WHERE AccID = @accno

update Dispenser					--update dispenser
set Amount = Amount - @amount

end		--end of PROCEDURE


--validate transfer requests
CREATE PROCEDURE validate_transfer
@senderAcNo INT,
@recieverAcNo INT,
@amount INT,
@error INT = 0 output
as
BEGIN
--no need to check senderAcNo, already verified

SELECT *
FROM Accounts
WHERE AccID = @recieverAcNo

if @@ROWCOUNT = 0
BEGIN
set @error = 1						--account not found, RETURN 1
RETURN
end

DECLARE @bal INT;
SELECT @bal = Balance				--get current balance
FROM Accounts
WHERE AccID = @senderAcNo

if @amount > @bal
BEGIN
set @error = 2						--not enough balance in sender account
RETURN
end

SELECT @bal = Amount			
FROM Dispenser						--check cash in dispenser

if @amount > @bal
BEGIN
set @error = 3						--not enough cash in dispenser
RETURN
end
--all good

BEGIN TRANSACTION
SAVE TRANSACTION savepoINT
BEGIN TRY							 
update Accounts	set Balance = Balance - @amount WHERE AccID = @senderAcNo --subtract amount FROM sender
update Accounts set Balance = Balance + @amount WHERE AccID = @recieverAcNo --add INTO reciever account			
INSERT INTO Transfers VALUES (@senderAcNo, @recieverAcNo, @amount, GETDATE()); --record in transfers
END TRY
BEGIN CATCH
IF @@TRANCOUNT > 0
BEGIN
ROLLBACK TRANSACTION savepoINT;
END
END CATCH
COMMIT TRANSACTION
END		--end of PROCEDURE

--check balance
CREATE PROCEDURE balance
@accno INT,
@bal INT = 0 output
AS
BEGIN
SELECT @bal = Balance
FROM Accounts
WHERE AccID = @accno
END


--Change Pin
CREATE PROCEDURE changePin	
@oldpin INT,
@newPin INT,
@accno INT,
@error INT = 0 OUTPUT
AS
BEGIN
DECLARE @currPin INT;

SELECT @currPin = PIN
FROM Accounts
WHERE AccID = @accno

IF @currPin != @oldpin
BEGIN
SET @error = 1				--current pin incorrect
RETURN
END

BEGIN TRANSACTION
SAVE TRANSACTION savepoINT
BEGIN TRY
UPDATE Accounts				--change pin
SET PIN = @newPin
WHERE AccID = @accno
END TRY
BEGIN CATCH
IF @@TRANCOUNT > 0
BEGIN
ROLLBACK TRANSACTION savepoINT;
END
END CATCH
COMMIT TRANSACTION
END		--end of PROCEDURE


--add account
CREATE PROCEDURE add_account
@userid INT,
@accno INT,
@balance INT,
@error INT = 0 OUTPUT
AS
BEGIN

SELECT *			--see if given user exists or not
FROM UserBio
WHERE UserID = @userid
IF @@ROWCOUNT = 0
BEGIN
SET @error = 1;		--user not found
RETURN
END

SELECT *			--see if given accno is available or not	
FROM Accounts
WHERE AccID = @accno
if @@ROWCOUNT != 0
BEGIN
set @error = 2;		--acc number already exists
RETURN
end

--all good
DECLARE @newpin INT;
set @newpin = convert(numeric(4,0),rand() * 8999) + 1000;	--auto generate pin

BEGIN TRANSACTION
save TRANSACTION savepoINT
BEGIN try
INSERT INTO Accounts VALUES (@accno, @userid, @balance, @newpin, 0);
end try
BEGIN catch
if @@TRANCOUNT > 0
BEGIN
ROLLBACK TRANSACTION savepoINT;
end
end catch
commit TRANSACTION
end	--end of PROCEDURE


--add cash in dispenser
CREATE PROCEDURE addCash
@amount INT
as
BEGIN
BEGIN TRANSACTION
save TRANSACTION savepoINT
BEGIN try
update Dispenser
set Amount = Amount + @amount;
end try
BEGIN catch
if @@TRANCOUNT > 0
BEGIN
ROLLBACK TRANSACTION savepoINT;
end
end catch
commit TRANSACTION
end	--end of PROCEDURE

--suspend user
CREATE PROCEDURE suspendUser
@accno INT,
@error INT = 0 output
as
BEGIN
SELECT *
FROM Accounts
WHERE AccID = @accno
if @@ROWCOUNT = 0
BEGIN
set @error = 1			--accno not found
RETURN
end
update Accounts
set atm_access = 1
WHERE AccID = @accno
end	--end of PROCEDURE

--get user name
CREATE PROCEDURE getUserName
@accno INT,
@username VARCHAR output
as
BEGIN

SELECT @username = u.Name
FROM Accounts a inner join UserBio u on a.OwnerID = u.UserID
WHERE a.AccID = @accno
end

DROP PROCEDURE getUserName

--Triggers
--update cash and send email
CREATE trigger update_dispenser
on Dispenser
after update
as
BEGIN
DECLARE @cash INT;
SELECT @cash = Amount FROM Dispenser

if @cash < 1000
BEGIN
exec msdb.dbo.sp_send_dbmail @profile_name = 'MailTest17', @recipients = 'speedking4567@gmail.com', @subject = 'Low Cash in Dispenser', @body = 'Cash in dispenser has DROPped below Rs. 1000. Please update.', @body_format = 'text'
end
end --end of trigger

DROP trigger add_account1
--email usr after account CREATEd
CREATE trigger add_account1
on Accounts
after INSERT
as
BEGIN
DECLARE @uid INT,
		@pin VARCHAR(5),
		@uemail VARCHAR(max);
SELECT @uid = OwnerID, @pin = cast(PIN as VARCHAR(5))
FROM INSERTed
SELECT @uemail = Email
FROM UserBio
WHERE UserID = @uid

DECLARE @s VARCHAR(18),
		@st VARCHAR(21);
set @s = 'Your new PIN is: '
set @st = @s + @pin

exec msdb.dbo.sp_send_dbmail @profile_name = 'MailTest17', @recipients = @uemail, @subject = 'Account Added', @body = @st, @body_format = 'text'

end	--end of trigger



DROP trigger add_account1

SELECT * FROM Accounts
INSERT INTO UserBio VALUES (7, '33201-452156-09', 'Hanks', 'speedking4567@gmail.com', '0333332255');
INSERT INTO Accounts VALUES (6, 7, 500, 5588, 0)

delete FROM Accounts WHERE AccID = 6






--Views
--a recipt of TRANSACTIONs (all withdrawals + transfers)
CREATE view transfersRecipt		
as
--SELECT only necessary info
SELECT RecieverAccNo as Money_Sent_To, Amount, Dateof		
FROM Tranfers


CREATE view withdrawalsRecipt
as
SELECT Amount, Dateof
FROM Withdrawals

exec msdb.dbo.sp_send_dbmail @profile_name = 'MailTest17', @recipients = 'speedking4567@gmail.com', @subject = 'Oye', @body = 'Mail Sent Successfully', @body_format = 'text'

SELECT * FROM msdb.dbo.sysmail_event_log;


