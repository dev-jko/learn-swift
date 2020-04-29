import UIKit
import Foundation
import SQLite3

let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    .appendingPathComponent("test.sqlite")

// open database

var db: OpaquePointer?
if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
    print("error opening database")
}


if sqlite3_exec(db, "create table if not exists test (id integer primary key autoincrement, name text)", nil, nil, nil) != SQLITE_OK {
    let errmsg = String(cString: sqlite3_errmsg(db)!)
    print("error creating table: \(errmsg)")
}

db

internal let SQLITE_STATIC = unsafeBitCast(0, to: sqlite3_destructor_type.self)
internal let SQLITE_TRANSIENT = unsafeBitCast(-1, to: sqlite3_destructor_type.self)

var statement: OpaquePointer?

if sqlite3_prepare_v2(db, "insert into test (name) values (?)", -1, &statement, nil) != SQLITE_OK {
    let errmsg = String(cString: sqlite3_errmsg(db)!)
    print("error preparing insert: \(errmsg)")
}

if sqlite3_bind_text(statement, 1, "foo", -1, SQLITE_TRANSIENT) != SQLITE_OK {
    let errmsg = String(cString: sqlite3_errmsg(db)!)
    print("failure binding foo: \(errmsg)")
}

if sqlite3_step(statement) != SQLITE_DONE {
    let errmsg = String(cString: sqlite3_errmsg(db)!)
    print("failure inserting foo: \(errmsg)")
}

if sqlite3_finalize(statement) != SQLITE_OK {
    let errmsg = String(cString: sqlite3_errmsg(db)!)
    print("error finalizing prepared statement: \(errmsg)")
}

statement = nil


if sqlite3_prepare_v2(db, "select id, name from test", -1, &statement, nil) != SQLITE_OK {
    let errmsg = String(cString: sqlite3_errmsg(db)!)
    print("error preparing select: \(errmsg)")
}

while sqlite3_step(statement) == SQLITE_ROW {
    let id = sqlite3_column_int64(statement, 0)
    print("id = \(id); ", terminator: "")

    if let cString = sqlite3_column_text(statement, 1) {
        let name = String(cString: cString)
        print("name = \(name)")
    } else {
        print("name not found")
    }
}

if sqlite3_finalize(statement) != SQLITE_OK {
    let errmsg = String(cString: sqlite3_errmsg(db)!)
    print("error finalizing prepared statement: \(errmsg)")
}

statement = nil
